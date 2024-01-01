import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseIjinCountDataModel {

  const ResponseIjinCountDataModel({
    required this.pending,
    required this.approve,
    required this.reject,
  });

  final int pending;
  final int approve;
  final int reject;

  factory ResponseIjinCountDataModel.fromJson(Map<String,dynamic> json) => ResponseIjinCountDataModel(
    pending: json['pending'] as int,
    approve: json['approve'] as int,
    reject: json['reject'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'pending': pending,
    'approve': approve,
    'reject': reject
  };

  ResponseIjinCountDataModel clone() => ResponseIjinCountDataModel(
    pending: pending,
    approve: approve,
    reject: reject
  );


  ResponseIjinCountDataModel copyWith({
    int? pending,
    int? approve,
    int? reject
  }) => ResponseIjinCountDataModel(
    pending: pending ?? this.pending,
    approve: approve ?? this.approve,
    reject: reject ?? this.reject,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseIjinCountDataModel && pending == other.pending && approve == other.approve && reject == other.reject;

  @override
  int get hashCode => pending.hashCode ^ approve.hashCode ^ reject.hashCode;
}
