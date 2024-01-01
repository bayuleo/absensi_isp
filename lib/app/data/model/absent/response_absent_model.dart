import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class ResponseAbsentModel {

  const ResponseAbsentModel({
    required this.success,
    required this.timestamp,
    this.data,
  });

  final bool success;
  final String timestamp;
  final ResponseAbsentDataModel? data;

  factory ResponseAbsentModel.fromJson(Map<String,dynamic> json) => ResponseAbsentModel(
    success: json['success'] as bool,
    timestamp: json['timestamp'].toString(),
    data: json['data'] != null ? ResponseAbsentDataModel.fromJson(json['data'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'timestamp': timestamp,
    'data': data?.toJson()
  };

  ResponseAbsentModel clone() => ResponseAbsentModel(
    success: success,
    timestamp: timestamp,
    data: data?.clone()
  );


  ResponseAbsentModel copyWith({
    bool? success,
    String? timestamp,
    Optional<ResponseAbsentDataModel?>? data
  }) => ResponseAbsentModel(
    success: success ?? this.success,
    timestamp: timestamp ?? this.timestamp,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseAbsentModel && success == other.success && timestamp == other.timestamp && data == other.data;

  @override
  int get hashCode => success.hashCode ^ timestamp.hashCode ^ data.hashCode;
}
