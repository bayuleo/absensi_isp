import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class DashboardAbsentDataModel {

  const DashboardAbsentDataModel({
    required this.kerja,
    required this.ijin,
  });

  final DashboardAbsentDataKerjaModel kerja;
  final DashboardAbsentDataIjinModel ijin;

  factory DashboardAbsentDataModel.fromJson(Map<String,dynamic> json) => DashboardAbsentDataModel(
    kerja: DashboardAbsentDataKerjaModel.fromJson(json['kerja'] as Map<String, dynamic>),
    ijin: DashboardAbsentDataIjinModel.fromJson(json['ijin'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'kerja': kerja.toJson(),
    'ijin': ijin.toJson()
  };

  DashboardAbsentDataModel clone() => DashboardAbsentDataModel(
    kerja: kerja.clone(),
    ijin: ijin.clone()
  );


  DashboardAbsentDataModel copyWith({
    DashboardAbsentDataKerjaModel? kerja,
    DashboardAbsentDataIjinModel? ijin
  }) => DashboardAbsentDataModel(
    kerja: kerja ?? this.kerja,
    ijin: ijin ?? this.ijin,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DashboardAbsentDataModel && kerja == other.kerja && ijin == other.ijin;

  @override
  int get hashCode => kerja.hashCode ^ ijin.hashCode;
}
