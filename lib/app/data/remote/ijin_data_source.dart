import 'dart:io';

import 'package:asiagolf_app/app/data/local/user_credentials_data_source.dart';
import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/network/dio_config.dart';
import 'package:asiagolf_app/app/network/endpoints.dart';
import 'package:asiagolf_app/app/utils/enum/status.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';

abstract class IjinDataSource {
  Future<ResponseIjinCountModel> getCountLembur(String year);
  Future<ResponseIjinCountModel> getCountIjin(String year);
  Future<ResponseIjinListModel> getListIjin(String year, String status);
  Future<ResponseIjinListModel> getListLembur(String year, String status);
  Future<ResponseDetailIjinModel> getDetailIjin(int id);
  Future<ResponseCreateIjinModel> createIjin(
      RequestCreateIjinMode requestCreateIjinMode, File? file);
}

class IjinDataSourceImpl implements IjinDataSource {
  final _userCredentialLocal = Get.find<UserCredentialsDataSource>();
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseIjinCountModel> getCountLembur(String year) async {
    var response = await dioConfigure.dio.get(
      "${endpoints.ijin.countIjin}?type=lembur&tahun=$year",
    );
    return ResponseIjinCountModel.fromJson(response.data);
  }

  @override
  Future<ResponseIjinCountModel> getCountIjin(String year) async {
    var response = await dioConfigure.dio.get(
      "${endpoints.ijin.countIjin}?type=cuti,ijin&tahun=$year",
    );
    return ResponseIjinCountModel.fromJson(response.data);
  }

  @override
  Future<ResponseCreateIjinModel> createIjin(
      RequestCreateIjinMode requestCreateIjinMode, File? file) async {
    final formData = d.FormData.fromMap({
      if (requestCreateIjinMode.title.isNotEmpty)
        "title": requestCreateIjinMode.title,
      if (requestCreateIjinMode.type.isNotEmpty)
        "type": requestCreateIjinMode.type,
      if (requestCreateIjinMode.timeStart.isNotEmpty)
        "time_start": requestCreateIjinMode.timeStart,
      if (requestCreateIjinMode.timeEnd.isNotEmpty)
        "time_end": requestCreateIjinMode.timeEnd,
      if (requestCreateIjinMode.description.isNotEmpty)
        "description": requestCreateIjinMode.description,
      if (file != null)
        'file': await d.MultipartFile.fromFile(file!.path,
            filename: file!.path.split('/').last),
    });
    var response = await dioConfigure.dio.post(
      endpoints.ijin.ijin,
      data: formData,
    );
    return ResponseCreateIjinModel.fromJson(response.data);
  }

  @override
  Future<ResponseIjinListModel> getListIjin(String year, String status) async {
    // final userId = _userCredentialLocal.getUserCredentials().id;
    var response = await dioConfigure.dio.get(
      "${endpoints.ijin.ijin}?type=cuti,ijin&tahun=$year${status != StatusRequest.all.value ? '&status=$status' : ''}",
    );
    return ResponseIjinListModel.fromJson(response.data);
  }

  @override
  Future<ResponseIjinListModel> getListLembur(
      String year, String status) async {
    // final userId = _userCredentialLocal.getUserCredentials().id;
    var response = await dioConfigure.dio.get(
      "${endpoints.ijin.ijin}?type=lembur&tahun=$year${status != StatusRequest.all.value ? '&status=$status' : ''}",
    );
    return ResponseIjinListModel.fromJson(response.data);
  }

  @override
  Future<ResponseDetailIjinModel> getDetailIjin(int id) async {
    var response = await dioConfigure.dio.get(
      "${endpoints.ijin.ijin}/$id",
    );
    return ResponseDetailIjinModel.fromJson(response.data);
  }
}
