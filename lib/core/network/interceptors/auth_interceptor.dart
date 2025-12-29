import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Interceptor to automatically add authorization token to requests
class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  
  /// Key used to store the auth token in secure storage
  static const String tokenKey = 'auth_token';

  AuthInterceptor({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Retrieve token from secure storage
    final token = await _storage.read(key: tokenKey);
    
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    // Ensure we always send JSON
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler, 
  ) async {
    // Handle 401 Unauthorized - Token expired or invalid
    if (err.response?.statusCode == 401) {
      // Clear the stored token
      await _storage.delete(key: tokenKey);
      
      // The app should listen for auth state changes and redirect to login
      // This is handled by the AuthNotifier
    }
    
    super.onError(err, handler);
  }
}
