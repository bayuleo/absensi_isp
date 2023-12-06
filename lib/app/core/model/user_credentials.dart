import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

@immutable
class UserCredentials {
  const UserCredentials({
    this.id,
    this.refreshToken,
    this.accessToken,
    this.email,
  });

  final int? id;
  final String? refreshToken;
  final String? accessToken;
  final String? email;

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      UserCredentials(
          id: json['id'] as int,
          email: json['email'].toString(),
          accessToken: json['accessToken'].toString(),
          refreshToken: json['refreshToken'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'accessToken': accessToken,
        'refreshToken': refreshToken
      };

  UserCredentials clone() => UserCredentials(
      id: id,
      email: email,
      accessToken: accessToken,
      refreshToken: refreshToken);

  UserCredentials copyWith(
          {Optional<int?>? id,
          Optional<String?>? email,
          Optional<String?>? accessToken,
          Optional<String?>? refreshToken}) =>
      UserCredentials(
        id: checkOptional(id, () => this.id),
        email: checkOptional(email, () => this.email),
        accessToken: checkOptional(accessToken, () => this.accessToken),
        refreshToken: checkOptional(refreshToken, () => this.refreshToken),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCredentials &&
          id == other.id &&
          email == other.email &&
          accessToken == other.accessToken &&
          refreshToken == other.refreshToken;

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      accessToken.hashCode ^
      refreshToken.hashCode;
}
