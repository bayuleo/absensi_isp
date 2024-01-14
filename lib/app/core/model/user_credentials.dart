import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

@immutable
class UserCredentials {
  const UserCredentials(
      {this.id, this.refreshToken, this.accessToken, this.email, this.role});

  final int? id;
  final String? refreshToken;
  final String? accessToken;
  final String? email;
  final String? role;

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      UserCredentials(
          id: json['id'] as int,
          email: json['email'].toString(),
          accessToken: json['accessToken'].toString(),
          refreshToken: json['refreshToken'].toString(),
          role: json['role'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'role': role
      };

  UserCredentials clone() => UserCredentials(
        id: id,
        email: email,
        accessToken: accessToken,
        refreshToken: refreshToken,
        role: role,
      );

  UserCredentials copyWith(
          {Optional<int?>? id,
          Optional<String?>? email,
          Optional<String?>? accessToken,
          Optional<String?>? role,
          Optional<String?>? refreshToken}) =>
      UserCredentials(
        id: checkOptional(id, () => this.id),
        email: checkOptional(email, () => this.email),
        accessToken: checkOptional(accessToken, () => this.accessToken),
        refreshToken: checkOptional(refreshToken, () => this.refreshToken),
        role: checkOptional(role, () => this.role),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCredentials &&
          id == other.id &&
          email == other.email &&
          accessToken == other.accessToken &&
          role == other.role &&
          refreshToken == other.refreshToken;

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      accessToken.hashCode ^
      role.hashCode ^
      refreshToken.hashCode;
}
