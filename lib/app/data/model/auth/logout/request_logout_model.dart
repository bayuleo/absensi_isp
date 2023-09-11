import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class RequestLogoutModel {

  const RequestLogoutModel({
    required this.fcmToken,
  });

  final String fcmToken;

  factory RequestLogoutModel.fromJson(Map<String,dynamic> json) => RequestLogoutModel(
    fcmToken: json['fcm_token'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'fcm_token': fcmToken
  };

  RequestLogoutModel clone() => RequestLogoutModel(
    fcmToken: fcmToken
  );


  RequestLogoutModel copyWith({
    String? fcmToken
  }) => RequestLogoutModel(
    fcmToken: fcmToken ?? this.fcmToken,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestLogoutModel && fcmToken == other.fcmToken;

  @override
  int get hashCode => fcmToken.hashCode;
}
