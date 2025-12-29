import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/network/api_config.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../core/utils/result.dart';
import '../dto/auth_response.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

/// Concrete implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final FlutterSecureStorage _storage;

  AuthRepositoryImpl({required Dio dio, required FlutterSecureStorage storage})
    : _dio = dio,
      _storage = storage;

  @override
  Future<Result<AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConfig.login,
        data: {'email': email, 'password': password},
      );

      final responseData = response.data as Map<String, dynamic>;

      // Check if OTP is required
      if (responseData['status'] == 'otp_required') {
        // Store temp token for OTP verification
        await _storage.write(
          key: StorageKeys.tempToken,
          value: responseData['temp_token'],
        );
        throw ApiException(
          message: 'OTP verification required',
          statusCode: 200,
          data: responseData,
        );
      }

      // Parse response - API returns: { message, data: { user, token, token_type } }
      final data =
          responseData['data'] as Map<String, dynamic>? ?? responseData;

      // Extract token and user from data
      final token = data['token'] as String? ?? '';
      final userData = data['user'] as Map<String, dynamic>?;

      if (token.isEmpty || userData == null) {
        throw ApiException(
          message: 'Invalid response: missing token or user data',
        );
      }

      final user = User.fromJson(userData);
      final authResponse = AuthResponse(token: token, user: user);

      // Store token and user data
      await storeToken(authResponse.token);
      await storeUser(authResponse.user);

      return Result.success(authResponse);
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } on ApiException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(ApiException(message: e.toString()));
    }
  }

  @override
  Future<Result<AuthResponse>> verifyOtp({
    required String code,
    required String tempToken,
  }) async {
    try {
      final response = await _dio.post(
        ApiConfig.verifyOtp,
        data: {'code': code, 'temp_token': tempToken},
      );

      final authResponse = AuthResponse.fromJson(response.data);

      // Store token and user data
      await storeToken(authResponse.token);
      await storeUser(authResponse.user);

      // Clear temp token
      await _storage.delete(key: StorageKeys.tempToken);

      return Result.success(authResponse);
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      return Result.error(ApiException(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      // Call logout API
      await _dio.post(ApiConfig.logout);

      // Clear all auth data
      await clearAuthData();

      return const Result.success(null);
    } on DioException catch (e) {
      // Even if API fails, clear local data
      await clearAuthData();
      return Result.error(_handleDioError(e));
    } catch (e) {
      await clearAuthData();
      return Result.error(ApiException(message: e.toString()));
    }
  }

  @override
  Future<Result<User>> getCurrentUser() async {
    try {
      final response = await _dio.get(ApiConfig.me);
      final user = User.fromJson(response.data['user'] ?? response.data);

      // Update stored user
      await storeUser(user);

      return Result.success(user);
    } on DioException catch (e) {
      return Result.error(_handleDioError(e));
    } catch (e) {
      return Result.error(ApiException(message: e.toString()));
    }
  }

  @override
  Future<String?> getStoredToken() async {
    return await _storage.read(key: StorageKeys.authToken);
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await getStoredToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> storeToken(String token) async {
    await _storage.write(key: StorageKeys.authToken, value: token);
  }

  @override
  Future<void> storeUser(User user) async {
    await _storage.write(
      key: StorageKeys.userData,
      value: jsonEncode(user.toJson()),
    );
  }

  @override
  Future<User?> getStoredUser() async {
    final userData = await _storage.read(key: StorageKeys.userData);
    if (userData == null) return null;

    try {
      return User.fromJson(jsonDecode(userData));
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> clearAuthData() async {
    await _storage.delete(key: StorageKeys.authToken);
    await _storage.delete(key: StorageKeys.refreshToken);
    await _storage.delete(key: StorageKeys.userData);
    await _storage.delete(key: StorageKeys.tempToken);
  }

  ApiException _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException.timeout();
      case DioExceptionType.connectionError:
        return ApiException.noConnection();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final data = e.response?.data;

        if (statusCode == 401) {
          return ApiException.unauthorized();
        } else if (statusCode == 403) {
          return ApiException.forbidden();
        } else if (statusCode == 404) {
          return ApiException.notFound();
        } else if (statusCode == 422) {
          // Validation error
          final message = data is Map
              ? data['message'] ?? 'Validation failed'
              : 'Validation failed';
          return ApiException(message: message, statusCode: statusCode);
        } else if (statusCode != null && statusCode >= 500) {
          return ApiException.serverError();
        }

        final message = data is Map
            ? data['message'] ?? 'Request failed'
            : 'Request failed';
        return ApiException(message: message, statusCode: statusCode);
      default:
        return ApiException(message: e.message ?? 'Unknown error');
    }
  }
}

/// Provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    dio: ref.watch(dioProvider),
    storage: ref.watch(secureStorageProvider),
  );
});
