import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseListUsersModel {

  const ResponseListUsersModel({
    required this.success,
    required this.timestamp,
    this.data,
  });

  final bool success;
  final String timestamp;
  final List<ResponseListUsersDataModel>? data;

  factory ResponseListUsersModel.fromJson(Map<String,dynamic> json) => ResponseListUsersModel(
    success: json['success'] as bool,
    timestamp: json['timestamp'].toString(),
    data: json['data'] != null ? (json['data'] as List? ?? []).map((e) => ResponseListUsersDataModel.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'timestamp': timestamp,
    'data': data?.map((e) => e.toJson()).toList()
  };

  ResponseListUsersModel clone() => ResponseListUsersModel(
    success: success,
    timestamp: timestamp,
    data: data?.map((e) => e.clone()).toList()
  );


  ResponseListUsersModel copyWith({
    bool? success,
    String? timestamp,
    Optional<List<ResponseListUsersDataModel>?>? data
  }) => ResponseListUsersModel(
    success: success ?? this.success,
    timestamp: timestamp ?? this.timestamp,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseListUsersModel && success == other.success && timestamp == other.timestamp && data == other.data;

  @override
  int get hashCode => success.hashCode ^ timestamp.hashCode ^ data.hashCode;
}
