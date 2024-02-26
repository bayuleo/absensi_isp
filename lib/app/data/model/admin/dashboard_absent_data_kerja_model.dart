import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class DashboardAbsentDataKerjaModel {

  const DashboardAbsentDataKerjaModel({
    required this.count,
    required this.data,
  });

  final int count;
  final List<dynamic> data;

  factory DashboardAbsentDataKerjaModel.fromJson(Map<String,dynamic> json) => DashboardAbsentDataKerjaModel(
    count: json['count'] as int,
    data: (json['data'] as List? ?? []).map((e) => e as dynamic).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'count': count,
    'data': data.map((e) => e.toString()).toList()
  };

  DashboardAbsentDataKerjaModel clone() => DashboardAbsentDataKerjaModel(
    count: count,
    data: data.toList()
  );


  DashboardAbsentDataKerjaModel copyWith({
    int? count,
    List<dynamic>? data
  }) => DashboardAbsentDataKerjaModel(
    count: count ?? this.count,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DashboardAbsentDataKerjaModel && count == other.count && data == other.data;

  @override
  int get hashCode => count.hashCode ^ data.hashCode;
}
