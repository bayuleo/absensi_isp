import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseDetailIjinDataModel {

  const ResponseDetailIjinDataModel({
    required this.id,
    required this.title,
    required this.type,
    required this.timeStart,
    required this.timeEnd,
    required this.description,
    required this.status,
    this.notes,
    this.path,
    this.filename,
    this.mimetype,
    required this.createdAt,
    required this.updatedAt,
    required this.users,
  });

  final int id;
  final String title;
  final String type;
  final String timeStart;
  final String timeEnd;
  final String description;
  final String status;
  final String? notes;
  final String? path;
  final String? filename;
  final String? mimetype;
  final String createdAt;
  final String updatedAt;
  final ResponseDetailIjinUserModel users;

  factory ResponseDetailIjinDataModel.fromJson(Map<String,dynamic> json) => ResponseDetailIjinDataModel(
    id: json['id'] as int,
    title: json['title'].toString(),
    type: json['type'].toString(),
    timeStart: json['time_start'].toString(),
    timeEnd: json['time_end'].toString(),
    description: json['description'].toString(),
    status: json['status'].toString(),
    notes: json['notes']?.toString(),
    path: json['path']?.toString(),
    filename: json['filename']?.toString(),
    mimetype: json['mimetype']?.toString(),
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString(),
    users: ResponseDetailIjinUserModel.fromJson(json['users'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'type': type,
    'time_start': timeStart,
    'time_end': timeEnd,
    'description': description,
    'status': status,
    'notes': notes,
    'path': path,
    'filename': filename,
    'mimetype': mimetype,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'users': users.toJson()
  };

  ResponseDetailIjinDataModel clone() => ResponseDetailIjinDataModel(
    id: id,
    title: title,
    type: type,
    timeStart: timeStart,
    timeEnd: timeEnd,
    description: description,
    status: status,
    notes: notes,
    path: path,
    filename: filename,
    mimetype: mimetype,
    createdAt: createdAt,
    updatedAt: updatedAt,
    users: users.clone()
  );


  ResponseDetailIjinDataModel copyWith({
    int? id,
    String? title,
    String? type,
    String? timeStart,
    String? timeEnd,
    String? description,
    String? status,
    Optional<String?>? notes,
    Optional<String?>? path,
    Optional<String?>? filename,
    Optional<String?>? mimetype,
    String? createdAt,
    String? updatedAt,
    ResponseDetailIjinUserModel? users
  }) => ResponseDetailIjinDataModel(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type ?? this.type,
    timeStart: timeStart ?? this.timeStart,
    timeEnd: timeEnd ?? this.timeEnd,
    description: description ?? this.description,
    status: status ?? this.status,
    notes: checkOptional(notes, () => this.notes),
    path: checkOptional(path, () => this.path),
    filename: checkOptional(filename, () => this.filename),
    mimetype: checkOptional(mimetype, () => this.mimetype),
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    users: users ?? this.users,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDetailIjinDataModel && id == other.id && title == other.title && type == other.type && timeStart == other.timeStart && timeEnd == other.timeEnd && description == other.description && status == other.status && notes == other.notes && path == other.path && filename == other.filename && mimetype == other.mimetype && createdAt == other.createdAt && updatedAt == other.updatedAt && users == other.users;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ type.hashCode ^ timeStart.hashCode ^ timeEnd.hashCode ^ description.hashCode ^ status.hashCode ^ notes.hashCode ^ path.hashCode ^ filename.hashCode ^ mimetype.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ users.hashCode;
}
