import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/network/dio_config.dart';
import 'package:asiagolf_app/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class UsersDataSource {
  Future<ResponseUsersModel> getProfile();
}

class UsersDataSourceImpl implements UsersDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseUsersModel> getProfile() async {
    var response = await dioConfigure.dio.get(
      endpoints.users.profile,
    );
    return ResponseUsersModel.fromJson(response.data);
  }
}
