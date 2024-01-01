import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseOtpDataModel {

  const ResponseOtpDataModel({
    required this.message,
  });

  final String message;

  factory ResponseOtpDataModel.fromJson(Map<String,dynamic> json) => ResponseOtpDataModel(
    message: json['message'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'message': message
  };

  ResponseOtpDataModel clone() => ResponseOtpDataModel(
    message: message
  );


  ResponseOtpDataModel copyWith({
    String? message
  }) => ResponseOtpDataModel(
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseOtpDataModel && message == other.message;

  @override
  int get hashCode => message.hashCode;
}
