import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseForgotPasswordDataModel {

  const ResponseForgotPasswordDataModel({
    required this.success,
    required this.message,
  });

  final bool success;
  final String message;

  factory ResponseForgotPasswordDataModel.fromJson(Map<String,dynamic> json) => ResponseForgotPasswordDataModel(
    success: json['success'] as bool,
    message: json['message'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message
  };

  ResponseForgotPasswordDataModel clone() => ResponseForgotPasswordDataModel(
    success: success,
    message: message
  );


  ResponseForgotPasswordDataModel copyWith({
    bool? success,
    String? message
  }) => ResponseForgotPasswordDataModel(
    success: success ?? this.success,
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseForgotPasswordDataModel && success == other.success && message == other.message;

  @override
  int get hashCode => success.hashCode ^ message.hashCode;
}
