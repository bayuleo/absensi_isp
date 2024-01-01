import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseCreateIjinModel {

  const ResponseCreateIjinModel({
    required this.success,
    this.data,
    required this.timestamp,
  });

  final bool success;
  final ResponseCreateIjinDataModel? data;
  final String timestamp;

  factory ResponseCreateIjinModel.fromJson(Map<String,dynamic> json) => ResponseCreateIjinModel(
    success: json['success'] as bool,
    data: json['data'] != null ? ResponseCreateIjinDataModel.fromJson(json['data'] as Map<String, dynamic>) : null,
    timestamp: json['timestamp'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'timestamp': timestamp
  };

  ResponseCreateIjinModel clone() => ResponseCreateIjinModel(
    success: success,
    data: data?.clone(),
    timestamp: timestamp
  );


  ResponseCreateIjinModel copyWith({
    bool? success,
    Optional<ResponseCreateIjinDataModel?>? data,
    String? timestamp
  }) => ResponseCreateIjinModel(
    success: success ?? this.success,
    data: checkOptional(data, () => this.data),
    timestamp: timestamp ?? this.timestamp,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCreateIjinModel && success == other.success && data == other.data && timestamp == other.timestamp;

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ timestamp.hashCode;
}
