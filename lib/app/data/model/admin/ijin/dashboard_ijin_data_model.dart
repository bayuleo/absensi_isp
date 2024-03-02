import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class DashboardIjinDataModel {

  const DashboardIjinDataModel({
    required this.ijin,
    required this.lembur,
  });

  final DashboardIjinDataIjinModel ijin;
  final DashboardIjinDataLemburModel lembur;

  factory DashboardIjinDataModel.fromJson(Map<String,dynamic> json) => DashboardIjinDataModel(
    ijin: DashboardIjinDataIjinModel.fromJson(json['ijin'] as Map<String, dynamic>),
    lembur: DashboardIjinDataLemburModel.fromJson(json['lembur'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'ijin': ijin.toJson(),
    'lembur': lembur.toJson()
  };

  DashboardIjinDataModel clone() => DashboardIjinDataModel(
    ijin: ijin.clone(),
    lembur: lembur.clone()
  );


  DashboardIjinDataModel copyWith({
    DashboardIjinDataIjinModel? ijin,
    DashboardIjinDataLemburModel? lembur
  }) => DashboardIjinDataModel(
    ijin: ijin ?? this.ijin,
    lembur: lembur ?? this.lembur,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DashboardIjinDataModel && ijin == other.ijin && lembur == other.lembur;

  @override
  int get hashCode => ijin.hashCode ^ lembur.hashCode;
}
