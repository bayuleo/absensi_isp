import 'dart:io';

import 'package:asiagolf_app/app/data/remote/absent_data_source.dart';
import 'package:get/get.dart';

import '../model/absent/response_absent_model.dart';

abstract class UsersRepository {
  Future<ResponseAbsentModel> clockIn({
    String? longlat,
    String? desc,
    File image,
  });

  Future<ResponseAbsentModel> clockOut({
    String? longlat,
    String? desc,
    File image,
  });

  Future<ResponseAbsentModel> getMyAbsent();
}

class UsersRepositoryImpl implements UsersRepository {
  final _absentDataSource = Get.find<AbsentDataSource>();

  @override
  Future<ResponseAbsentModel> clockIn({
    String? longlat,
    String? desc,
    File? image,
  }) async {
    final res = await _absentDataSource.clockIn(
      longlat: longlat,
      desc: desc,
      image: image,
    );
    return res;
  }

  @override
  Future<ResponseAbsentModel> clockOut({
    String? longlat,
    String? desc,
    File? image,
  }) async {
    final res = await _absentDataSource.clockOut(
      longlat: longlat,
      desc: desc,
      image: image,
    );
    return res;
  }

  @override
  Future<ResponseAbsentModel> getMyAbsent() async {
    final res = await _absentDataSource.getMyAbsent();
    return res;
  }
}