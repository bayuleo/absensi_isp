import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseDetailAbsentModel {

  const ResponseDetailAbsentModel({
    required this.success,
    required this.timestamp,
    this.data,
  });

  final bool success;
  final String timestamp;
  final ResponseDetailAbsentDataModel? data;

  factory ResponseDetailAbsentModel.fromJson(Map<String,dynamic> json) => ResponseDetailAbsentModel(
    success: json['success'] as bool,
    timestamp: json['timestamp'].toString(),
    data: json['data'] != null ? ResponseDetailAbsentDataModel.fromJson(json['data'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'timestamp': timestamp,
    'data': data?.toJson()
  };

  ResponseDetailAbsentModel clone() => ResponseDetailAbsentModel(
    success: success,
    timestamp: timestamp,
    data: data?.clone()
  );


  ResponseDetailAbsentModel copyWith({
    bool? success,
    String? timestamp,
    Optional<ResponseDetailAbsentDataModel?>? data
  }) => ResponseDetailAbsentModel(
    success: success ?? this.success,
    timestamp: timestamp ?? this.timestamp,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDetailAbsentModel && success == other.success && timestamp == other.timestamp && data == other.data;

  @override
  int get hashCode => success.hashCode ^ timestamp.hashCode ^ data.hashCode;
}
