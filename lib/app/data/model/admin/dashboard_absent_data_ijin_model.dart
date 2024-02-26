import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class DashboardAbsentDataIjinModel {

  const DashboardAbsentDataIjinModel({
    required this.count,
    required this.data,
  });

  final int count;
  final List<dynamic> data;

  factory DashboardAbsentDataIjinModel.fromJson(Map<String,dynamic> json) => DashboardAbsentDataIjinModel(
    count: json['count'] as int,
    data: (json['data'] as List? ?? []).map((e) => e as dynamic).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'count': count,
    'data': data.map((e) => e.toString()).toList()
  };

  DashboardAbsentDataIjinModel clone() => DashboardAbsentDataIjinModel(
    count: count,
    data: data.toList()
  );


  DashboardAbsentDataIjinModel copyWith({
    int? count,
    List<dynamic>? data
  }) => DashboardAbsentDataIjinModel(
    count: count ?? this.count,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DashboardAbsentDataIjinModel && count == other.count && data == other.data;

  @override
  int get hashCode => count.hashCode ^ data.hashCode;
}
