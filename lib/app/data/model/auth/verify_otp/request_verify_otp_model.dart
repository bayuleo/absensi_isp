import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class RequestVerifyOtpModel {

  const RequestVerifyOtpModel({
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  factory RequestVerifyOtpModel.fromJson(Map<String,dynamic> json) => RequestVerifyOtpModel(
    email: json['email'].toString(),
    code: json['code'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'email': email,
    'code': code
  };

  RequestVerifyOtpModel clone() => RequestVerifyOtpModel(
    email: email,
    code: code
  );


  RequestVerifyOtpModel copyWith({
    String? email,
    String? code
  }) => RequestVerifyOtpModel(
    email: email ?? this.email,
    code: code ?? this.code,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestVerifyOtpModel && email == other.email && code == other.code;

  @override
  int get hashCode => email.hashCode ^ code.hashCode;
}
