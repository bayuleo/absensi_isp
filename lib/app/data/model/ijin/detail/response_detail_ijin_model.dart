import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseDetailIjinModel {

  const ResponseDetailIjinModel({
    required this.success,
    required this.data,
    required this.timestamp,
  });

  final bool success;
  final ResponseDetailIjinDataModel data;
  final String timestamp;

  factory ResponseDetailIjinModel.fromJson(Map<String,dynamic> json) => ResponseDetailIjinModel(
    success: json['success'] as bool,
    data: ResponseDetailIjinDataModel.fromJson(json['data'] as Map<String, dynamic>),
    timestamp: json['timestamp'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data.toJson(),
    'timestamp': timestamp
  };

  ResponseDetailIjinModel clone() => ResponseDetailIjinModel(
    success: success,
    data: data.clone(),
    timestamp: timestamp
  );


  ResponseDetailIjinModel copyWith({
    bool? success,
    ResponseDetailIjinDataModel? data,
    String? timestamp
  }) => ResponseDetailIjinModel(
    success: success ?? this.success,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDetailIjinModel && success == other.success && data == other.data && timestamp == other.timestamp;

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ timestamp.hashCode;
}
