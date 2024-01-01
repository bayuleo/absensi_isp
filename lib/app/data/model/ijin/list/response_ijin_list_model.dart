import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseIjinListModel {

  const ResponseIjinListModel({
    required this.success,
    required this.timestamp,
    this.data,
  });

  final bool success;
  final String timestamp;
  final List<ResponseIjinListIjinModel>? data;

  factory ResponseIjinListModel.fromJson(Map<String,dynamic> json) => ResponseIjinListModel(
    success: json['success'] as bool,
    timestamp: json['timestamp'].toString(),
    data: json['data'] != null ? (json['data'] as List? ?? []).map((e) => ResponseIjinListIjinModel.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'timestamp': timestamp,
    'data': data?.map((e) => e.toJson()).toList()
  };

  ResponseIjinListModel clone() => ResponseIjinListModel(
    success: success,
    timestamp: timestamp,
    data: data?.map((e) => e.clone()).toList()
  );


  ResponseIjinListModel copyWith({
    bool? success,
    String? timestamp,
    Optional<List<ResponseIjinListIjinModel>?>? data
  }) => ResponseIjinListModel(
    success: success ?? this.success,
    timestamp: timestamp ?? this.timestamp,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseIjinListModel && success == other.success && timestamp == other.timestamp && data == other.data;

  @override
  int get hashCode => success.hashCode ^ timestamp.hashCode ^ data.hashCode;
}
