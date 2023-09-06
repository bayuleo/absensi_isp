import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseLoginModel {

  const ResponseLoginModel({
    required this.status,
    required this.message,
    this.data,
  });

  final bool status;
  final String message;
  final ResponseLoginDataModel? data;

  factory ResponseLoginModel.fromJson(Map<String,dynamic> json) => ResponseLoginModel(
    status: json['status'] as bool,
    message: json['message'].toString(),
    data: json['data'] != null ? ResponseLoginDataModel.fromJson(json['data'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson()
  };


  ResponseLoginModel copyWith({
    bool? status,
    String? message,
    Optional<ResponseLoginDataModel?>? data
  }) => ResponseLoginModel(
    status: status ?? this.status,
    message: message ?? this.message,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseLoginModel && status == other.status && message == other.message && data == other.data;

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
