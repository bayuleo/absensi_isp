import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseLogoutModel {

  const ResponseLogoutModel({
    required this.status,
    required this.message,
  });

  final bool status;
  final String message;

  factory ResponseLogoutModel.fromJson(Map<String,dynamic> json) => ResponseLogoutModel(
    status: json['status'] as bool,
    message: json['message'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message
  };

  ResponseLogoutModel clone() => ResponseLogoutModel(
    status: status,
    message: message
  );


  ResponseLogoutModel copyWith({
    bool? status,
    String? message
  }) => ResponseLogoutModel(
    status: status ?? this.status,
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseLogoutModel && status == other.status && message == other.message;

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
