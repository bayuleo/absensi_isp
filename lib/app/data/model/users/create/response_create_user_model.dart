import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseCreateUserModel {

  const ResponseCreateUserModel({
    required this.success,
    this.data,
    required this.timestamp,
  });

  final bool success;
  final ResponseCreateUserDataModel? data;
  final String timestamp;

  factory ResponseCreateUserModel.fromJson(Map<String,dynamic> json) => ResponseCreateUserModel(
    success: json['success'] as bool,
    data: json['data'] != null ? ResponseCreateUserDataModel.fromJson(json['data'] as Map<String, dynamic>) : null,
    timestamp: json['timestamp'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'timestamp': timestamp
  };

  ResponseCreateUserModel clone() => ResponseCreateUserModel(
    success: success,
    data: data?.clone(),
    timestamp: timestamp
  );


  ResponseCreateUserModel copyWith({
    bool? success,
    Optional<ResponseCreateUserDataModel?>? data,
    String? timestamp
  }) => ResponseCreateUserModel(
    success: success ?? this.success,
    data: checkOptional(data, () => this.data),
    timestamp: timestamp ?? this.timestamp,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCreateUserModel && success == other.success && data == other.data && timestamp == other.timestamp;

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ timestamp.hashCode;
}
