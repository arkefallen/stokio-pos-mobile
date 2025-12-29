import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/storage/secure_storage.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

part 'auth_notifier.g.dart';

/// AuthNotifier manages authentication state throughout the app
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.watch(authRepositoryProvider);

    // Check initial auth state on build
    _checkInitialAuthState();

    return const AuthState.initial();
  }

  /// Check if user is already authenticated on app start
  Future<void> _checkInitialAuthState() async {
    try {
      final isAuthenticated = await _repository.isAuthenticated();

      if (isAuthenticated) {
        // Try to get stored user first
        final storedUser = await _repository.getStoredUser();

        if (storedUser != null) {
          state = AuthState.authenticated(storedUser);
          return;
        } else {
          // No stored user, logout
          state = const AuthState.unauthenticated();
          return;
        }
      } else {
        state = const AuthState.unauthenticated();
        return;
      }
    } catch (e) {
      state = const AuthState.unauthenticated();
      return;
    }
  }

  /// Attempt to login with email and password
  Future<void> login({required String email, required String password}) async {
    state = const AuthState.loading();

    final result = await _repository.login(email: email, password: password);

    state = result.fold(
      onSuccess: (response) => AuthState.authenticated(response.user),
      onError: (exception) {
        // Check if OTP is required
        final exceptionStr = exception.toString();
        if (exceptionStr.contains('OTP') || exceptionStr.contains('otp')) {
          return AuthState.otpRequired(
            tempToken: '',
            message: 'Please enter the OTP sent to your email',
          );
        }
        return AuthState.error(_parseErrorMessage(exception.toString()));
      },
    );
  }

  /// Verify OTP code
  Future<void> verifyOtp(String code) async {
    state = const AuthState.loading();

    // Get temp token from storage
    final tempToken = await ref
        .read(secureStorageProvider)
        .read(key: 'temp_token');

    if (tempToken == null || tempToken.isEmpty) {
      state = const AuthState.error('OTP session expired. Please login again.');
      return;
    }

    final result = await _repository.verifyOtp(
      code: code,
      tempToken: tempToken,
    );

    state = result.fold(
      onSuccess: (response) => AuthState.authenticated(response.user),
      onError: (exception) =>
          AuthState.error(_parseErrorMessage(exception.toString())),
    );
  }

  /// Logout the current user
  Future<void> logout() async {
    state = const AuthState.loading();

    try {
      await _repository.logout();
    } catch (e) {
      // Ignore logout errors, just clear local state
    }

    state = const AuthState.unauthenticated();
  }

  /// Reset error state
  void clearError() {
    if (state is AuthStateError) {
      state = const AuthState.unauthenticated();
    }
  }

  /// Parse error message for user-friendly display
  String _parseErrorMessage(String error) {
    if (error.contains('401') || error.contains('Unauthorized')) {
      return 'Invalid email or password';
    }
    if (error.contains('connection') ||
        error.contains('network') ||
        error.contains('SocketException')) {
      return 'Unable to connect to server. Please check your connection.';
    }
    if (error.contains('timeout')) {
      return 'Request timed out. Please try again.';
    }
    // Return cleaned error message
    return error
        .replaceAll('Exception:', '')
        .replaceAll('ApiException:', '')
        .trim();
  }
}

/// Convenience provider to check if user is authenticated
@riverpod
bool isAuthenticated(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState is AuthStateAuthenticated;
}

/// Convenience provider to get current user (null if not authenticated)
@riverpod
User? currentUser(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  return switch (authState) {
    AuthStateAuthenticated(:final user) => user,
    _ => null,
  };
}

/// Alias for backward compatibility
final authNotifierProvider = authProvider;
