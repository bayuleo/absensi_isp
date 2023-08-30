import 'package:asiagolf_app/app/domain/entities/common_entity.dart';

import 'auth_data_model.dart';

class AuthModel extends CommonEntity {
  AuthModel.fromJson(Map<String, dynamic> json)
      : super(
          message: json['token_type'].toString(),
          data: AuthDataModel.fromJson(json['data'] as Map<String, dynamic>),
        );
}
