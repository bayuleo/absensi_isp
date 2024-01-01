import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseLoginDataModel {

  const ResponseLoginDataModel({
    required this.id,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
    required this.role,
  });

  final int id;
  final String email;
  final String accessToken;
  final String refreshToken;
  final String role;

  factory ResponseLoginDataModel.fromJson(Map<String,dynamic> json) => ResponseLoginDataModel(
    id: json['id'] as int,
    email: json['email'].toString(),
    accessToken: json['accessToken'].toString(),
    refreshToken: json['refreshToken'].toString(),
    role: json['role'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'role': role
  };

  ResponseLoginDataModel clone() => ResponseLoginDataModel(
    id: id,
    email: email,
    accessToken: accessToken,
    refreshToken: refreshToken,
    role: role
  );


  ResponseLoginDataModel copyWith({
    int? id,
    String? email,
    String? accessToken,
    String? refreshToken,
    String? role
  }) => ResponseLoginDataModel(
    id: id ?? this.id,
    email: email ?? this.email,
    accessToken: accessToken ?? this.accessToken,
    refreshToken: refreshToken ?? this.refreshToken,
    role: role ?? this.role,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseLoginDataModel && id == other.id && email == other.email && accessToken == other.accessToken && refreshToken == other.refreshToken && role == other.role;

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ accessToken.hashCode ^ refreshToken.hashCode ^ role.hashCode;
}
