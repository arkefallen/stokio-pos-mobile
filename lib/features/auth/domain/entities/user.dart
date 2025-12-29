import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User entity representing an authenticated user
@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required String role, // 'cashier', 'admin', 'manager'
    String? avatarUrl,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Check if the user has admin privileges
  bool get isAdmin => role == 'admin';
  
  /// Check if the user is a cashier
  bool get isCashier => role == 'cashier';
  
  /// Check if the user is a manager
  bool get isManager => role == 'manager';
  
  /// Get display initials for avatar
  String get initials {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.substring(0, 2).toUpperCase();
  }
  
  @override
  String? get avatarUrl => throw UnimplementedError();
  
  @override
  String get email => throw UnimplementedError();
  
  @override
  int get id => throw UnimplementedError();
  
  @override
  String get name => throw UnimplementedError();
  
  @override
  String get role => throw UnimplementedError();
  
  @override
  Map<String, dynamic> toJson() {

    throw UnimplementedError();
  }
}
