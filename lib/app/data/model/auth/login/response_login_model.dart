import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseLoginModel {

  const ResponseLoginModel({
    required this.success,
    required this.timestamp,
    this.data,
  });

  final bool success;
  final String timestamp;
  final ResponseLoginDataModel? data;

  factory ResponseLoginModel.fromJson(Map<String,dynamic> json) => ResponseLoginModel(
    success: json['success'] as bool,
    timestamp: json['timestamp'].toString(),
    data: json['data'] != null ? ResponseLoginDataModel.fromJson(json['data'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'timestamp': timestamp,
    'data': data?.toJson()
  };

  ResponseLoginModel clone() => ResponseLoginModel(
    success: success,
    timestamp: timestamp,
    data: data?.clone()
  );


  ResponseLoginModel copyWith({
    bool? success,
    String? timestamp,
    Optional<ResponseLoginDataModel?>? data
  }) => ResponseLoginModel(
    success: success ?? this.success,
    timestamp: timestamp ?? this.timestamp,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseLoginModel && success == other.success && timestamp == other.timestamp && data == other.data;

  @override
  int get hashCode => success.hashCode ^ timestamp.hashCode ^ data.hashCode;
}
