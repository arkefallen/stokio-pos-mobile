import '../../../../core/utils/result.dart';
import '../../data/dto/auth_response.dart';
import '../entities/user.dart';

/// Abstract repository interface for authentication
/// Defines the contract for auth operations
abstract class AuthRepository {
  /// Attempt to login with email and password
  /// Returns AuthResponse on success, or OtpRequiredResponse JSON if OTP needed
  Future<Result<AuthResponse>> login({
    required String email,
    required String password,
  });

  /// Verify OTP code to complete login
  Future<Result<AuthResponse>> verifyOtp({
    required String code,
    required String tempToken,
  });

  /// Logout the current user
  Future<Result<void>> logout();

  /// Get current authenticated user from API
  Future<Result<User>> getCurrentUser();

  /// Get the stored auth token
  Future<String?> getStoredToken();

  /// Check if user is authenticated (has valid token)
  Future<bool> isAuthenticated();

  /// Store authentication token
  Future<void> storeToken(String token);

  /// Store user data locally
  Future<void> storeUser(User user);

  /// Get locally stored user
  Future<User?> getStoredUser();

  /// Clear all auth data (on logout)
  Future<void> clearAuthData();
}
