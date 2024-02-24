import 'dart:io';

import 'package:asiagolf_app/app/data/local/user_credentials_data_source.dart';
import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/network/dio_config.dart';
import 'package:asiagolf_app/app/network/endpoints.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';

abstract class AbsentDataSource {
  Future<ResponseAbsentModel> clockIn({
    String? longlat,
    String? desc,
    File? image,
    bool isManual = false,
    String? shift,
    String? manualTime,
  });

  Future<ResponseAbsentModel> clockOut({
    String? longlat,
    String? desc,
    File? image,
    bool isManual = false,
    String? shift,
    String? manualTime,
  });

  Future<ResponseAbsentModel> getMyAbsent();

  Future<ResponseDetailAbsentModel> getDetailAbsen(int id);
}

class AbsentDataSourceImpl implements AbsentDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();
  final _userCredentialLocal = Get.find<UserCredentialsDataSource>();

  @override
  Future<ResponseAbsentModel> clockIn({
    String? longlat,
    String? desc,
    File? image,
    bool isManual = false,
    String? shift,
    String? manualTime,
  }) async {
    final formData = d.FormData.fromMap({
      "longlat": longlat,
      "description": desc,
      if (image != null)
        "file": await d.MultipartFile.fromFile(image!.path,
            filename: image!.path.split('/').last),
      "is_manual": isManual,
      "shift": shift,
      if (manualTime != null && manualTime != '') "time": manualTime,
    });

    var response = await dioConfigure.dio.post(
      endpoints.absent.checkIn,
      data: formData,
    );
    return ResponseAbsentModel.fromJson(response.data);
  }

  @override
  Future<ResponseAbsentModel> clockOut({
    String? longlat,
    String? desc,
    File? image,
    bool isManual = false,
    String? shift,
    String? manualTime,
  }) async {
    final formData = d.FormData.fromMap({
      "longlat": longlat,
      "description": desc,
      if (image != null)
        "file": await d.MultipartFile.fromFile(image!.path,
            filename: image!.path.split('/').last),
      "is_manual": isManual,
      "shift": shift,
      if (manualTime != null && manualTime != '') "time": manualTime,
    });

    var response = await dioConfigure.dio.post(
      endpoints.absent.checkOut,
      data: formData,
    );
    return ResponseAbsentModel.fromJson(response.data);
  }

  @override
  Future<ResponseAbsentModel> getMyAbsent() async {
    final userId = _userCredentialLocal.getUserCredentials().id;
    var response =
        await dioConfigure.dio.get('${endpoints.absent.myAbsent}/$userId');
    return ResponseAbsentModel.fromJson(response.data);
  }

  @override
  Future<ResponseDetailAbsentModel> getDetailAbsen(int id) async {
    var response = await dioConfigure.dio.get('${endpoints.absent.detail}/$id');
    return ResponseDetailAbsentModel.fromJson(response.data);
  }
}
