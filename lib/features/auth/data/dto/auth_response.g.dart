// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{'token': instance.token, 'user': instance.user};

_OtpRequiredResponse _$OtpRequiredResponseFromJson(Map<String, dynamic> json) =>
    _OtpRequiredResponse(
      status: json['status'] as String,
      tempToken: json['temp_token'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OtpRequiredResponseToJson(
  _OtpRequiredResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'temp_token': instance.tempToken,
  'message': instance.message,
};

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_VerifyOtpRequest _$VerifyOtpRequestFromJson(Map<String, dynamic> json) =>
    _VerifyOtpRequest(
      code: json['code'] as String,
      tempToken: json['temp_token'] as String,
    );

Map<String, dynamic> _$VerifyOtpRequestToJson(_VerifyOtpRequest instance) =>
    <String, dynamic>{'code': instance.code, 'temp_token': instance.tempToken};
