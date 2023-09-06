import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class RequestLoginModel {

  const RequestLoginModel({
    required this.email,
    required this.password,
    required this.fcmToken,
  });

  final String email;
  final String password;
  final String fcmToken;

  factory RequestLoginModel.fromJson(Map<String,dynamic> json) => RequestLoginModel(
    email: json['email'].toString(),
    password: json['password'].toString(),
    fcmToken: json['fcm_token'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'fcm_token': fcmToken
  };

  RequestLoginModel clone() => RequestLoginModel(
    email: email,
    password: password,
    fcmToken: fcmToken
  );


  RequestLoginModel copyWith({
    String? email,
    String? password,
    String? fcmToken
  }) => RequestLoginModel(
    email: email ?? this.email,
    password: password ?? this.password,
    fcmToken: fcmToken ?? this.fcmToken,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestLoginModel && email == other.email && password == other.password && fcmToken == other.fcmToken;

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ fcmToken.hashCode;
}
