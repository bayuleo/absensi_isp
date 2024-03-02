import 'dart:io';

import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/network/dio_config.dart';
import 'package:asiagolf_app/app/network/endpoints.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';

abstract class AdminDataSource {
  Future<ResponseCreateUserModel> addUser({
    String? name,
    String? nik,
    String? address,
    String? email,
    String? phone,
    String? role,
    String? workingHour,
    String? password,
    File? image,
  });

  Future<bool> updateUser({
    required String id,
    String? name,
    String? nik,
    String? address,
    String? email,
    String? phone,
    String? role,
    String? workingHour,
    String? password,
    File? image,
  });

  Future<ResponseListUsersModel> getAllUser();
  Future<bool> removeUser(int id);
  Future<ResponseUsersModel> getUserById(int id);
  Future<DashboardAbsentModel> getDashboardAbsent();
  Future<DashboardIjinModel> getDashboardIjin();
}

class AdminDataSourceImpl implements AdminDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseCreateUserModel> addUser({
    String? name,
    String? nik,
    String? address,
    String? email,
    String? phone,
    String? role,
    String? workingHour,
    String? password,
    File? image,
  }) async {
    final formData = d.FormData.fromMap({
      "name": name,
      "nik": nik,
      "address": address,
      "phone": phone,
      "email": email,
      "position": role,
      "password": password,
      if (image != null)
        'file': await d.MultipartFile.fromFile(image!.path,
            filename: image!.path.split('/').last),
    });
    var response = await dioConfigure.dio.post(
      endpoints.admin.users,
      data: formData,
    );
    return ResponseCreateUserModel.fromJson(response.data);
  }

  @override
  Future<bool> updateUser({
    required String id,
    String? name,
    String? nik,
    String? address,
    String? email,
    String? phone,
    String? role,
    String? workingHour,
    String? password,
    File? image,
  }) async {
    final formData = d.FormData.fromMap({
      "name": name,
      "nik": nik,
      "address": address,
      "phone": phone,
      "email": email,
      "position": role,
      "password": password,
      if (image != null)
        'file': await d.MultipartFile.fromFile(image!.path,
            filename: image!.path.split('/').last),
    });
    var response = await dioConfigure.dio.patch(
      '${endpoints.admin.users}/$id',
      data: formData,
    );
    return true;
  }

  @override
  Future<ResponseListUsersModel> getAllUser() async {
    var response = await dioConfigure.dio.get(
      endpoints.admin.users,
    );
    return ResponseListUsersModel.fromJson(response.data);
  }

  @override
  Future<bool> removeUser(int id) async {
    await dioConfigure.dio.delete(
      '${endpoints.admin.users}/$id',
    );
    return true;
  }

  @override
  Future<ResponseUsersModel> getUserById(int id) async {
    var response = await dioConfigure.dio.get(
      '${endpoints.admin.users}/$id',
    );
    return ResponseUsersModel.fromJson(response.data);
  }

  @override
  Future<DashboardAbsentModel> getDashboardAbsent() async {
    var response = await dioConfigure.dio.get(
      endpoints.admin.dashboardAbsen,
    );
    return DashboardAbsentModel.fromJson(response.data);
  }

  @override
  Future<DashboardIjinModel> getDashboardIjin() async {
    var response = await dioConfigure.dio.get(
      endpoints.admin.dashboardIjin,
    );
    return DashboardIjinModel.fromJson(response.data);
  }
}
