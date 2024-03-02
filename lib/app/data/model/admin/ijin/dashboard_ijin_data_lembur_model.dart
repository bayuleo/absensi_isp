import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class DashboardIjinDataLemburModel {

  const DashboardIjinDataLemburModel({
    required this.count,
    required this.data,
  });

  final int count;
  final List<DashboardIjinDataLemburDataModel> data;

  factory DashboardIjinDataLemburModel.fromJson(Map<String,dynamic> json) => DashboardIjinDataLemburModel(
    count: json['count'] as int,
    data: (json['data'] as List? ?? []).map((e) => DashboardIjinDataLemburDataModel.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'count': count,
    'data': data.map((e) => e.toJson()).toList()
  };

  DashboardIjinDataLemburModel clone() => DashboardIjinDataLemburModel(
    count: count,
    data: data.map((e) => e.clone()).toList()
  );


  DashboardIjinDataLemburModel copyWith({
    int? count,
    List<DashboardIjinDataLemburDataModel>? data
  }) => DashboardIjinDataLemburModel(
    count: count ?? this.count,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DashboardIjinDataLemburModel && count == other.count && data == other.data;

  @override
  int get hashCode => count.hashCode ^ data.hashCode;
}
