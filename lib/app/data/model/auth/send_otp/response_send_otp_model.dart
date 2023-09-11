import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseSendOtpModel {

  const ResponseSendOtpModel({
    required this.status,
    required this.message,
  });

  final bool status;
  final String message;

  factory ResponseSendOtpModel.fromJson(Map<String,dynamic> json) => ResponseSendOtpModel(
    status: json['status'] as bool,
    message: json['message'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message
  };

  ResponseSendOtpModel clone() => ResponseSendOtpModel(
    status: status,
    message: message
  );


  ResponseSendOtpModel copyWith({
    bool? status,
    String? message
  }) => ResponseSendOtpModel(
    status: status ?? this.status,
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseSendOtpModel && status == other.status && message == other.message;

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
