import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class DashboardIjinModel {

  const DashboardIjinModel({
    required this.success,
    required this.data,
    required this.timestamp,
  });

  final bool success;
  final DashboardIjinDataModel data;
  final String timestamp;

  factory DashboardIjinModel.fromJson(Map<String,dynamic> json) => DashboardIjinModel(
    success: json['success'] as bool,
    data: DashboardIjinDataModel.fromJson(json['data'] as Map<String, dynamic>),
    timestamp: json['timestamp'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data.toJson(),
    'timestamp': timestamp
  };

  DashboardIjinModel clone() => DashboardIjinModel(
    success: success,
    data: data.clone(),
    timestamp: timestamp
  );


  DashboardIjinModel copyWith({
    bool? success,
    DashboardIjinDataModel? data,
    String? timestamp
  }) => DashboardIjinModel(
    success: success ?? this.success,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DashboardIjinModel && success == other.success && data == other.data && timestamp == other.timestamp;

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ timestamp.hashCode;
}
