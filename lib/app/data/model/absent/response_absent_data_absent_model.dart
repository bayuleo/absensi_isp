import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class ResponseAbsentDataAbsentModel {

  const ResponseAbsentDataAbsentModel({
    required this.id,
    required this.date,
    required this.time,
    required this.type,
    required this.description,
    required this.longlat,
    required this.path,
    required this.filename,
    required this.mimetype,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String date;
  final String time;
  final String type;
  final String description;
  final String longlat;
  final String path;
  final String filename;
  final String mimetype;
  final String createdAt;
  final String updatedAt;

  factory ResponseAbsentDataAbsentModel.fromJson(Map<String,dynamic> json) => ResponseAbsentDataAbsentModel(
    id: json['id'] as int,
    date: json['date'].toString(),
    time: json['time'].toString(),
    type: json['type'].toString(),
    description: json['description'].toString(),
    longlat: json['longlat'].toString(),
    path: json['path'].toString(),
    filename: json['filename'].toString(),
    mimetype: json['mimetype'].toString(),
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'time': time,
    'type': type,
    'description': description,
    'longlat': longlat,
    'path': path,
    'filename': filename,
    'mimetype': mimetype,
    'created_at': createdAt,
    'updated_at': updatedAt
  };

  ResponseAbsentDataAbsentModel clone() => ResponseAbsentDataAbsentModel(
    id: id,
    date: date,
    time: time,
    type: type,
    description: description,
    longlat: longlat,
    path: path,
    filename: filename,
    mimetype: mimetype,
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  ResponseAbsentDataAbsentModel copyWith({
    int? id,
    String? date,
    String? time,
    String? type,
    String? description,
    String? longlat,
    String? path,
    String? filename,
    String? mimetype,
    String? createdAt,
    String? updatedAt
  }) => ResponseAbsentDataAbsentModel(
    id: id ?? this.id,
    date: date ?? this.date,
    time: time ?? this.time,
    type: type ?? this.type,
    description: description ?? this.description,
    longlat: longlat ?? this.longlat,
    path: path ?? this.path,
    filename: filename ?? this.filename,
    mimetype: mimetype ?? this.mimetype,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseAbsentDataAbsentModel && id == other.id && date == other.date && time == other.time && type == other.type && description == other.description && longlat == other.longlat && path == other.path && filename == other.filename && mimetype == other.mimetype && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ date.hashCode ^ time.hashCode ^ type.hashCode ^ description.hashCode ^ longlat.hashCode ^ path.hashCode ^ filename.hashCode ^ mimetype.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
