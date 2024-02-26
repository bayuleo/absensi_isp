import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class DashboardAbsentModel {

  const DashboardAbsentModel({
    required this.success,
    required this.data,
    required this.timestamp,
  });

  final bool success;
  final DashboardAbsentDataModel data;
  final String timestamp;

  factory DashboardAbsentModel.fromJson(Map<String,dynamic> json) => DashboardAbsentModel(
    success: json['success'] as bool,
    data: DashboardAbsentDataModel.fromJson(json['data'] as Map<String, dynamic>),
    timestamp: json['timestamp'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data.toJson(),
    'timestamp': timestamp
  };

  DashboardAbsentModel clone() => DashboardAbsentModel(
    success: success,
    data: data.clone(),
    timestamp: timestamp
  );


  DashboardAbsentModel copyWith({
    bool? success,
    DashboardAbsentDataModel? data,
    String? timestamp
  }) => DashboardAbsentModel(
    success: success ?? this.success,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DashboardAbsentModel && success == other.success && data == other.data && timestamp == other.timestamp;

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ timestamp.hashCode;
}
