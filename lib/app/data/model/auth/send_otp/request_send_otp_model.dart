import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class RequestSendOtpModel {

  const RequestSendOtpModel({
    required this.email,
  });

  final String email;

  factory RequestSendOtpModel.fromJson(Map<String,dynamic> json) => RequestSendOtpModel(
    email: json['email'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'email': email
  };

  RequestSendOtpModel clone() => RequestSendOtpModel(
    email: email
  );


  RequestSendOtpModel copyWith({
    String? email
  }) => RequestSendOtpModel(
    email: email ?? this.email,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestSendOtpModel && email == other.email;

  @override
  int get hashCode => email.hashCode;
}
