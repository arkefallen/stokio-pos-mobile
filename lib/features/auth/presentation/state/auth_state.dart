import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user.dart';

part 'auth_state.freezed.dart';

/// Represents the different states of authentication
@freezed
sealed class AuthState with _$AuthState {
  /// Initial state - not yet determined
  const factory AuthState.initial() = AuthStateInitial;
  
  /// Loading state - checking auth or processing login
  const factory AuthState.loading() = AuthStateLoading;
  
  /// Authenticated state - user is logged in
  const factory AuthState.authenticated(User user) = AuthStateAuthenticated;
  
  /// Unauthenticated state - user is not logged in
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  
  /// OTP required state - need OTP verification
  const factory AuthState.otpRequired({
    required String tempToken,
    String? message,
  }) = AuthStateOtpRequired;
  
  /// Error state - authentication failed
  const factory AuthState.error(String message) = AuthStateError;
}
