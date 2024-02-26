import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseIjinByIdDataIjinModel {

  const ResponseIjinByIdDataIjinModel({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.status,
    required this.notes,
    required this.filename,
    required this.timeStart,
    required this.timeEnd,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String type;
  final String description;
  final String status;
  final String notes;
  final String filename;
  final String timeStart;
  final String timeEnd;
  final String createdAt;
  final String updatedAt;

  factory ResponseIjinByIdDataIjinModel.fromJson(Map<String,dynamic> json) => ResponseIjinByIdDataIjinModel(
    id: json['id'] as int,
    title: json['title'].toString(),
    type: json['type'].toString(),
    description: json['description'].toString(),
    status: json['status'].toString(),
    notes: json['notes'].toString(),
    filename: json['filename'].toString(),
    timeStart: json['time_start'].toString(),
    timeEnd: json['time_end'].toString(),
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'type': type,
    'description': description,
    'status': status,
    'notes': notes,
    'filename': filename,
    'time_start': timeStart,
    'time_end': timeEnd,
    'created_at': createdAt,
    'updated_at': updatedAt
  };

  ResponseIjinByIdDataIjinModel clone() => ResponseIjinByIdDataIjinModel(
    id: id,
    title: title,
    type: type,
    description: description,
    status: status,
    notes: notes,
    filename: filename,
    timeStart: timeStart,
    timeEnd: timeEnd,
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  ResponseIjinByIdDataIjinModel copyWith({
    int? id,
    String? title,
    String? type,
    String? description,
    String? status,
    String? notes,
    String? filename,
    String? timeStart,
    String? timeEnd,
    String? createdAt,
    String? updatedAt
  }) => ResponseIjinByIdDataIjinModel(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type ?? this.type,
    description: description ?? this.description,
    status: status ?? this.status,
    notes: notes ?? this.notes,
    filename: filename ?? this.filename,
    timeStart: timeStart ?? this.timeStart,
    timeEnd: timeEnd ?? this.timeEnd,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseIjinByIdDataIjinModel && id == other.id && title == other.title && type == other.type && description == other.description && status == other.status && notes == other.notes && filename == other.filename && timeStart == other.timeStart && timeEnd == other.timeEnd && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ type.hashCode ^ description.hashCode ^ status.hashCode ^ notes.hashCode ^ filename.hashCode ^ timeStart.hashCode ^ timeEnd.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
