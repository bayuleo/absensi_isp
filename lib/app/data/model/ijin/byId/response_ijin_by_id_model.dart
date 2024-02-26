import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseIjinByIdModel {

  const ResponseIjinByIdModel({
    required this.success,
    required this.timestamp,
    this.data,
  });

  final bool success;
  final String timestamp;
  final ResponseIjinByIdDataModel? data;

  factory ResponseIjinByIdModel.fromJson(Map<String,dynamic> json) => ResponseIjinByIdModel(
    success: json['success'] as bool,
    timestamp: json['timestamp'].toString(),
    data: json['data'] != null ? ResponseIjinByIdDataModel.fromJson(json['data'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'timestamp': timestamp,
    'data': data?.toJson()
  };

  ResponseIjinByIdModel clone() => ResponseIjinByIdModel(
    success: success,
    timestamp: timestamp,
    data: data?.clone()
  );


  ResponseIjinByIdModel copyWith({
    bool? success,
    String? timestamp,
    Optional<ResponseIjinByIdDataModel?>? data
  }) => ResponseIjinByIdModel(
    success: success ?? this.success,
    timestamp: timestamp ?? this.timestamp,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseIjinByIdModel && success == other.success && timestamp == other.timestamp && data == other.data;

  @override
  int get hashCode => success.hashCode ^ timestamp.hashCode ^ data.hashCode;
}
