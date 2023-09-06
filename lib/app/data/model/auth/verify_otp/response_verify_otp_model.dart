import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseVerifyOtpModel {

  const ResponseVerifyOtpModel({
    required this.status,
    required this.message,
  });

  final bool status;
  final String message;

  factory ResponseVerifyOtpModel.fromJson(Map<String,dynamic> json) => ResponseVerifyOtpModel(
    status: json['status'] as bool,
    message: json['message'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message
  };

  ResponseVerifyOtpModel clone() => ResponseVerifyOtpModel(
    status: status,
    message: message
  );


  ResponseVerifyOtpModel copyWith({
    bool? status,
    String? message
  }) => ResponseVerifyOtpModel(
    status: status ?? this.status,
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseVerifyOtpModel && status == other.status && message == other.message;

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
