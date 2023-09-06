import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseRegisterModel {

  const ResponseRegisterModel({
    required this.status,
    required this.message,
    this.data,
  });

  final bool status;
  final String message;
  final ResponseRegisterDataModel? data;

  factory ResponseRegisterModel.fromJson(Map<String,dynamic> json) => ResponseRegisterModel(
    status: json['status'] as bool,
    message: json['message'].toString(),
    data: json['data'] != null ? ResponseRegisterDataModel.fromJson(json['data'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson()
  };

  ResponseRegisterModel copyWith({
    bool? status,
    String? message,
    Optional<ResponseRegisterDataModel?>? data
  }) => ResponseRegisterModel(
    status: status ?? this.status,
    message: message ?? this.message,
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseRegisterModel && status == other.status && message == other.message && data == other.data;

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
