import 'package:asiagolf_app/app/domain/entities/auth/auth_entity.dart';

class AuthDataModel extends AuthEntity {
  AuthDataModel.fromJson(Map<String, dynamic> json)
      : super(accessToken: json['accessToken'].toString());
}
