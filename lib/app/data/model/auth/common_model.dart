import 'package:flutter/foundation.dart';

@immutable
class CommonModel {
  const CommonModel({
    this.status,
    this.message,
  });

  final bool? status;
  final String? message;

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
      status: json['status'] != null ? json['status'] as bool : null,
      message: json['message']?.toString());

  Map<String, dynamic> toJson() => {'status': status, 'message': message};

  CommonModel clone() => CommonModel(status: status, message: message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommonModel &&
          status == other.status &&
          message == other.message;

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
