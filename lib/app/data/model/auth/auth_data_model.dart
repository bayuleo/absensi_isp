import 'package:asiagolf_app/app/domain/entities/auth_entity.dart';

class AuthDataModel extends AuthEntity {
  AuthDataModel.fromJson(Map<String, dynamic> json)
      : super(
            tokenType: json['token_type'].toString(),
            expiresIn: json['expires_in'] as int,
            accessToken: json['access_token'].toString(),
            refreshToken: json['refresh_token'].toString());

  Map<String, dynamic> toJson() => {
        'token_type': tokenType,
        'expires_in': expiresIn,
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };
}
