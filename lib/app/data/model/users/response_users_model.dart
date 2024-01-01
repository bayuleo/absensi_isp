import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class ResponseUsersModel {

  const ResponseUsersModel({
    required this.success,
    required this.timestamp,
    this.data,
  });

  final bool success;
  final String timestamp;
  final ResponseUsersDataModel? data;

  factory ResponseUsersModel.fromJson(Map<String,dynamic> json) => ResponseUsersModel(
    success: json['success'] as bool,
    timestamp: json['timestamp'].toString(),
    data: json['data'] != null ? ResponseUsersDataModel.fromJson(json['data'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'timestamp': timestamp,
    'data': data?.toJson()
  };

  ResponseUsersModel clone() => ResponseUsersModel(
    success: success,
    timestamp: timestamp,
    data: data?.clone()
  );


  ResponseUsersModel copyWith({
    bool? success,
    String? timestamp,
    Optional<ResponseUsersDataModel?>? data
  }) => ResponseUsersModel(
    success: success ?? this.success,
    timestamp: timestamp ?? this.timestamp,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseUsersModel && success == other.success && timestamp == other.timestamp && data == other.data;

  @override
  int get hashCode => success.hashCode ^ timestamp.hashCode ^ data.hashCode;
}
