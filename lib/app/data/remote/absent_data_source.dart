import 'dart:convert';

import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/network/dio_config.dart';
import 'package:asiagolf_app/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class AbsentDataSource {
  Future<ResponseAbsentModel> clockIn({
    String? longlat,
    String? desc,
    String? filePath,
  });

  Future<ResponseAbsentModel> clockOut({
    String? longlat,
    String? desc,
    String? filePath,
  });
}

class AbsentDataSourceImpl implements AbsentDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseAbsentModel> clockIn({
    String? longlat,
    String? desc,
    String? filePath,
  }) async {
    // String fileName = file.path.split('/').last;
    // var data = d.FormData.fromMap(
    //   {
    //     'file': await d.MultipartFile.fromFile(
    //       file.path,
    //       filename: fileName,
    //     )
    //   },
    // );
    var body = {};
    if (longlat != null) {
      body['longlat'] = longlat;
    }
    if (desc != null) {
      body['desc'] = desc;
    }

    var response = await dioConfigure.dio.post(
      endpoints.absent.checkIn,
      data: jsonEncode(body),
    );
    return ResponseAbsentModel.fromJson(response.data);
  }

  @override
  Future<ResponseAbsentModel> clockOut({
    String? longlat,
    String? desc,
    String? filePath,
  }) async {
    // String fileName = file.path.split('/').last;
    // var data = d.FormData.fromMap(
    //   {
    //     'file': await d.MultipartFile.fromFile(
    //       file.path,
    //       filename: fileName,
    //     )
    //   },
    // );
    var body = {};
    if (longlat != null) {
      body['longlat'] = longlat;
    }
    if (desc != null) {
      body['desc'] = desc;
    }

    var response = await dioConfigure.dio.post(
      endpoints.absent.checkOut,
      data: jsonEncode(body),
    );
    return ResponseAbsentModel.fromJson(response.data);
  }
}
