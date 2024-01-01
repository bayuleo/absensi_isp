import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseChangePaswordModel {

  const ResponseChangePaswordModel({
    required this.success,
    required this.data,
    required this.timestamp,
  });

  final bool success;
  final String data;
  final String timestamp;

  factory ResponseChangePaswordModel.fromJson(Map<String,dynamic> json) => ResponseChangePaswordModel(
    success: json['success'] as bool,
    data: json['data'].toString(),
    timestamp: json['timestamp'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data,
    'timestamp': timestamp
  };

  ResponseChangePaswordModel clone() => ResponseChangePaswordModel(
    success: success,
    data: data,
    timestamp: timestamp
  );


  ResponseChangePaswordModel copyWith({
    bool? success,
    String? data,
    String? timestamp
  }) => ResponseChangePaswordModel(
    success: success ?? this.success,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseChangePaswordModel && success == other.success && data == other.data && timestamp == other.timestamp;

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ timestamp.hashCode;
}
