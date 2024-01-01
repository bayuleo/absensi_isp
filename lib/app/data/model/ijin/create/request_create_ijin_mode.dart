import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class RequestCreateIjinMode {

  const RequestCreateIjinMode({
    required this.title,
    required this.type,
    required this.timeStart,
    required this.timeEnd,
    required this.description,
  });

  final String title;
  final String type;
  final String timeStart;
  final String timeEnd;
  final String description;

  factory RequestCreateIjinMode.fromJson(Map<String,dynamic> json) => RequestCreateIjinMode(
    title: json['title'].toString(),
    type: json['type'].toString(),
    timeStart: json['time_start'].toString(),
    timeEnd: json['time_end'].toString(),
    description: json['description'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'title': title,
    'type': type,
    'time_start': timeStart,
    'time_end': timeEnd,
    'description': description
  };

  RequestCreateIjinMode clone() => RequestCreateIjinMode(
    title: title,
    type: type,
    timeStart: timeStart,
    timeEnd: timeEnd,
    description: description
  );


  RequestCreateIjinMode copyWith({
    String? title,
    String? type,
    String? timeStart,
    String? timeEnd,
    String? description
  }) => RequestCreateIjinMode(
    title: title ?? this.title,
    type: type ?? this.type,
    timeStart: timeStart ?? this.timeStart,
    timeEnd: timeEnd ?? this.timeEnd,
    description: description ?? this.description,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestCreateIjinMode && title == other.title && type == other.type && timeStart == other.timeStart && timeEnd == other.timeEnd && description == other.description;

  @override
  int get hashCode => title.hashCode ^ type.hashCode ^ timeStart.hashCode ^ timeEnd.hashCode ^ description.hashCode;
}
