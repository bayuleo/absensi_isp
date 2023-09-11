import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseForgotPasswordModel {

  const ResponseForgotPasswordModel({
    required this.status,
    required this.message,
  });

  final bool status;
  final String message;

  factory ResponseForgotPasswordModel.fromJson(Map<String,dynamic> json) => ResponseForgotPasswordModel(
    status: json['status'] as bool,
    message: json['message'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message
  };

  ResponseForgotPasswordModel clone() => ResponseForgotPasswordModel(
    status: status,
    message: message
  );


  ResponseForgotPasswordModel copyWith({
    bool? status,
    String? message
  }) => ResponseForgotPasswordModel(
    status: status ?? this.status,
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseForgotPasswordModel && status == other.status && message == other.message;

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
