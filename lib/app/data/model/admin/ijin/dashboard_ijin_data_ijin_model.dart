import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class DashboardIjinDataIjinModel {

  const DashboardIjinDataIjinModel({
    required this.count,
    required this.data,
  });

  final int count;
  final List<DashboardIjinDataIjinDataModel> data;

  factory DashboardIjinDataIjinModel.fromJson(Map<String,dynamic> json) => DashboardIjinDataIjinModel(
    count: json['count'] as int,
    data: (json['data'] as List? ?? []).map((e) => DashboardIjinDataIjinDataModel.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'count': count,
    'data': data.map((e) => e.toJson()).toList()
  };

  DashboardIjinDataIjinModel clone() => DashboardIjinDataIjinModel(
    count: count,
    data: data.map((e) => e.clone()).toList()
  );


  DashboardIjinDataIjinModel copyWith({
    int? count,
    List<DashboardIjinDataIjinDataModel>? data
  }) => DashboardIjinDataIjinModel(
    count: count ?? this.count,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DashboardIjinDataIjinModel && count == other.count && data == other.data;

  @override
  int get hashCode => count.hashCode ^ data.hashCode;
}
