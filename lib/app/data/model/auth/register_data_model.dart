import 'package:asiagolf_app/app/domain/entities/auth/register_entity.dart';

class RegisterDataModel extends RegisterEntity {
  RegisterDataModel.fromJson(Map<String, dynamic> json)
      : super(
            email: json['email'].toString(),
            password: json['password'].toString());
}
