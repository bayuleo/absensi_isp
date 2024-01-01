import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseForgotPasswordModel {

  const ResponseForgotPasswordModel({
    required this.success,
    required this.data,
    required this.timestamp,
  });

  final bool success;
  final ResponseForgotPasswordDataModel data;
  final String timestamp;

  factory ResponseForgotPasswordModel.fromJson(Map<String,dynamic> json) => ResponseForgotPasswordModel(
    success: json['success'] as bool,
    data: ResponseForgotPasswordDataModel.fromJson(json['data'] as Map<String, dynamic>),
    timestamp: json['timestamp'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data.toJson(),
    'timestamp': timestamp
  };

  ResponseForgotPasswordModel clone() => ResponseForgotPasswordModel(
    success: success,
    data: data.clone(),
    timestamp: timestamp
  );


  ResponseForgotPasswordModel copyWith({
    bool? success,
    ResponseForgotPasswordDataModel? data,
    String? timestamp
  }) => ResponseForgotPasswordModel(
    success: success ?? this.success,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseForgotPasswordModel && success == other.success && data == other.data && timestamp == other.timestamp;

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ timestamp.hashCode;
}
