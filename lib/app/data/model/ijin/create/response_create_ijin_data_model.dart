import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseCreateIjinDataModel {

  const ResponseCreateIjinDataModel({
    required this.title,
    required this.type,
    required this.dateIjin,
    required this.description,
    required this.users,
    required this.path,
    required this.filename,
    required this.mimetype,
    required this.notes,
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String title;
  final String type;
  final String dateIjin;
  final String description;
  final ResponseCreateIjinUserModel users;
  final dynamic path;
  final dynamic filename;
  final dynamic mimetype;
  final dynamic notes;
  final int id;
  final String status;
  final String createdAt;
  final String updatedAt;

  factory ResponseCreateIjinDataModel.fromJson(Map<String,dynamic> json) => ResponseCreateIjinDataModel(
    title: json['title'].toString(),
    type: json['type'].toString(),
    dateIjin: json['date_ijin'].toString(),
    description: json['description'].toString(),
    users: ResponseCreateIjinUserModel.fromJson(json['users'] as Map<String, dynamic>),
    path: json['path'] as dynamic,
    filename: json['filename'] as dynamic,
    mimetype: json['mimetype'] as dynamic,
    notes: json['notes'] as dynamic,
    id: json['id'] as int,
    status: json['status'].toString(),
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'title': title,
    'type': type,
    'date_ijin': dateIjin,
    'description': description,
    'users': users.toJson(),
    'path': path,
    'filename': filename,
    'mimetype': mimetype,
    'notes': notes,
    'id': id,
    'status': status,
    'created_at': createdAt,
    'updated_at': updatedAt
  };

  ResponseCreateIjinDataModel clone() => ResponseCreateIjinDataModel(
    title: title,
    type: type,
    dateIjin: dateIjin,
    description: description,
    users: users.clone(),
    path: path,
    filename: filename,
    mimetype: mimetype,
    notes: notes,
    id: id,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  ResponseCreateIjinDataModel copyWith({
    String? title,
    String? type,
    String? dateIjin,
    String? description,
    ResponseCreateIjinUserModel? users,
    dynamic? path,
    dynamic? filename,
    dynamic? mimetype,
    dynamic? notes,
    int? id,
    String? status,
    String? createdAt,
    String? updatedAt
  }) => ResponseCreateIjinDataModel(
    title: title ?? this.title,
    type: type ?? this.type,
    dateIjin: dateIjin ?? this.dateIjin,
    description: description ?? this.description,
    users: users ?? this.users,
    path: path ?? this.path,
    filename: filename ?? this.filename,
    mimetype: mimetype ?? this.mimetype,
    notes: notes ?? this.notes,
    id: id ?? this.id,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCreateIjinDataModel && title == other.title && type == other.type && dateIjin == other.dateIjin && description == other.description && users == other.users && path == other.path && filename == other.filename && mimetype == other.mimetype && notes == other.notes && id == other.id && status == other.status && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => title.hashCode ^ type.hashCode ^ dateIjin.hashCode ^ description.hashCode ^ users.hashCode ^ path.hashCode ^ filename.hashCode ^ mimetype.hashCode ^ notes.hashCode ^ id.hashCode ^ status.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
