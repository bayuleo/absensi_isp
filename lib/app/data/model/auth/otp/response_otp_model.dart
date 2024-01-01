import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseOtpModel {

  const ResponseOtpModel({
    required this.success,
    required this.data,
    required this.timestamp,
  });

  final bool success;
  final ResponseOtpDataModel data;
  final String timestamp;

  factory ResponseOtpModel.fromJson(Map<String,dynamic> json) => ResponseOtpModel(
    success: json['success'] as bool,
    data: ResponseOtpDataModel.fromJson(json['data'] as Map<String, dynamic>),
    timestamp: json['timestamp'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data.toJson(),
    'timestamp': timestamp
  };

  ResponseOtpModel clone() => ResponseOtpModel(
    success: success,
    data: data.clone(),
    timestamp: timestamp
  );


  ResponseOtpModel copyWith({
    bool? success,
    ResponseOtpDataModel? data,
    String? timestamp
  }) => ResponseOtpModel(
    success: success ?? this.success,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseOtpModel && success == other.success && data == other.data && timestamp == other.timestamp;

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ timestamp.hashCode;
}
