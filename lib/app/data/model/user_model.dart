import 'package:asiagolf_app/app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json["id"],
          username: json["username"],
          email: json["email"],
          firstName: json["firstName"],
          lastName: json["lastName"],
          gender: json["gender"],
          image: json["image"],
          token: json["token"],
        );
}
