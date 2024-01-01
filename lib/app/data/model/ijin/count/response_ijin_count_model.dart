import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseIjinCountModel {

  const ResponseIjinCountModel({
    required this.success,
    required this.timestamp,
    this.data,
  });

  final bool success;
  final String timestamp;
  final ResponseIjinCountDataModel? data;

  factory ResponseIjinCountModel.fromJson(Map<String,dynamic> json) => ResponseIjinCountModel(
    success: json['success'] as bool,
    timestamp: json['timestamp'].toString(),
    data: json['data'] != null ? ResponseIjinCountDataModel.fromJson(json['data'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'timestamp': timestamp,
    'data': data?.toJson()
  };

  ResponseIjinCountModel clone() => ResponseIjinCountModel(
    success: success,
    timestamp: timestamp,
    data: data?.clone()
  );


  ResponseIjinCountModel copyWith({
    bool? success,
    String? timestamp,
    Optional<ResponseIjinCountDataModel?>? data
  }) => ResponseIjinCountModel(
    success: success ?? this.success,
    timestamp: timestamp ?? this.timestamp,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseIjinCountModel && success == other.success && timestamp == other.timestamp && data == other.data;

  @override
  int get hashCode => success.hashCode ^ timestamp.hashCode ^ data.hashCode;
}
