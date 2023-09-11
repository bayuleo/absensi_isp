import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class RequestForgotPasswordModel {

  const RequestForgotPasswordModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory RequestForgotPasswordModel.fromJson(Map<String,dynamic> json) => RequestForgotPasswordModel(
    email: json['email'].toString(),
    password: json['password'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password
  };

  RequestForgotPasswordModel clone() => RequestForgotPasswordModel(
    email: email,
    password: password
  );


  RequestForgotPasswordModel copyWith({
    String? email,
    String? password
  }) => RequestForgotPasswordModel(
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestForgotPasswordModel && email == other.email && password == other.password;

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
