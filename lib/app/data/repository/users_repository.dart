import 'package:asiagolf_app/app/data/model/users/response_users_model.dart';
import 'package:get/get.dart';

import '../remote/users_data_source.dart';

abstract class UsersRepository {
  Future<ResponseUsersModel> getProfile();

  // Future<void> signOut();
}

class UsersRepositoryImpl implements UsersRepository {
  final _usersDataSource = Get.find<UsersDataSource>();

  @override
  Future<ResponseUsersModel> getProfile() async {
    final res = await _usersDataSource.getProfile();
    return res;
  }
}
