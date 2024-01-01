import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class RequestLoginModel {

  const RequestLoginModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory RequestLoginModel.fromJson(Map<String,dynamic> json) => RequestLoginModel(
    email: json['email'].toString(),
    password: json['password'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password
  };

  RequestLoginModel clone() => RequestLoginModel(
    email: email,
    password: password
  );


  RequestLoginModel copyWith({
    String? email,
    String? password
  }) => RequestLoginModel(
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestLoginModel && email == other.email && password == other.password;

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
