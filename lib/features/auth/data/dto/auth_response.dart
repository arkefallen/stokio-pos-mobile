import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

/// Response from successful login
@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({required String token, required User user}) =
      _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
      
        @override
        String get token => throw UnimplementedError();
      
        @override
        User get user => throw UnimplementedError();
}

/// Response when OTP verification is required
@freezed
class OtpRequiredResponse with _$OtpRequiredResponse {
  const factory OtpRequiredResponse({
    required String status,
    @JsonKey(name: 'temp_token') required String tempToken,
    String? message,
  }) = _OtpRequiredResponse;

  factory OtpRequiredResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpRequiredResponseFromJson(json);
      
        @override
        String? get message => throw UnimplementedError();
      
        @override
        String get status => throw UnimplementedError();
      
        @override
        String get tempToken => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
}

/// Login request payload
@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
      
        @override
        String get email => throw UnimplementedError();
      
        @override
        String get password => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
}

/// OTP verification request payload
@freezed
class VerifyOtpRequest with _$VerifyOtpRequest {
  const factory VerifyOtpRequest({
    required String code,
    @JsonKey(name: 'temp_token') required String tempToken,
  }) = _VerifyOtpRequest;

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestFromJson(json);
      
        @override
        String get code => throw UnimplementedError();
      
        @override
        String get tempToken => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
}
