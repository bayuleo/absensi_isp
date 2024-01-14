import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseDetailAbsentDataModel {

  const ResponseDetailAbsentDataModel({
    required this.id,
    required this.date,
    required this.time,
    required this.type,
    required this.description,
    this.longlat,
    required this.filename,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.users,
  });

  final int id;
  final String date;
  final String time;
  final String type;
  final String description;
  final String? longlat;
  final String filename;
  final String? imagePath;
  final String createdAt;
  final String updatedAt;
  final ResponseDetailAbsentUserModel users;

  factory ResponseDetailAbsentDataModel.fromJson(Map<String,dynamic> json) => ResponseDetailAbsentDataModel(
    id: json['id'] as int,
    date: json['date'].toString(),
    time: json['time'].toString(),
    type: json['type'].toString(),
    description: json['description'].toString(),
    longlat: json['longlat']?.toString(),
    filename: json['filename'].toString(),
    imagePath: json['imagePath']?.toString(),
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString(),
    users: ResponseDetailAbsentUserModel.fromJson(json['users'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'time': time,
    'type': type,
    'description': description,
    'longlat': longlat,
    'filename': filename,
    'imagePath': imagePath,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'users': users.toJson()
  };

  ResponseDetailAbsentDataModel clone() => ResponseDetailAbsentDataModel(
    id: id,
    date: date,
    time: time,
    type: type,
    description: description,
    longlat: longlat,
    filename: filename,
    imagePath: imagePath,
    createdAt: createdAt,
    updatedAt: updatedAt,
    users: users.clone()
  );


  ResponseDetailAbsentDataModel copyWith({
    int? id,
    String? date,
    String? time,
    String? type,
    String? description,
    Optional<String?>? longlat,
    String? filename,
    Optional<String?>? imagePath,
    String? createdAt,
    String? updatedAt,
    ResponseDetailAbsentUserModel? users
  }) => ResponseDetailAbsentDataModel(
    id: id ?? this.id,
    date: date ?? this.date,
    time: time ?? this.time,
    type: type ?? this.type,
    description: description ?? this.description,
    longlat: checkOptional(longlat, () => this.longlat),
    filename: filename ?? this.filename,
    imagePath: checkOptional(imagePath, () => this.imagePath),
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    users: users ?? this.users,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDetailAbsentDataModel && id == other.id && date == other.date && time == other.time && type == other.type && description == other.description && longlat == other.longlat && filename == other.filename && imagePath == other.imagePath && createdAt == other.createdAt && updatedAt == other.updatedAt && users == other.users;

  @override
  int get hashCode => id.hashCode ^ date.hashCode ^ time.hashCode ^ type.hashCode ^ description.hashCode ^ longlat.hashCode ^ filename.hashCode ^ imagePath.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ users.hashCode;
}
