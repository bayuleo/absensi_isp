import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class RequestAbsentModel {

  const RequestAbsentModel({
    required this.longlat,
    required this.description,
    this.data,
  });

  final String longlat;
  final String description;
  final ResponseAbsentDataModel? data;

  factory RequestAbsentModel.fromJson(Map<String,dynamic> json) => RequestAbsentModel(
    longlat: json['longlat'].toString(),
    description: json['description'].toString(),
    data: json['data'] != null ? ResponseAbsentDataModel.fromJson(json['data'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'longlat': longlat,
    'description': description,
    'data': data?.toJson()
  };

  RequestAbsentModel clone() => RequestAbsentModel(
    longlat: longlat,
    description: description,
    data: data?.clone()
  );


  RequestAbsentModel copyWith({
    String? longlat,
    String? description,
    Optional<ResponseAbsentDataModel?>? data
  }) => RequestAbsentModel(
    longlat: longlat ?? this.longlat,
    description: description ?? this.description,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestAbsentModel && longlat == other.longlat && description == other.description && data == other.data;

  @override
  int get hashCode => longlat.hashCode ^ description.hashCode ^ data.hashCode;
}
