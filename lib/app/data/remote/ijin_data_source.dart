import 'dart:io';

import 'package:asiagolf_app/app/data/local/user_credentials_data_source.dart';
import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/network/dio_config.dart';
import 'package:asiagolf_app/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class IjinDataSource {
  Future<ResponseIjinCountModel> getCountLembur(String year);
  Future<ResponseIjinCountModel> getCountIjin(String year);
  Future<ResponseIjinListModel> getListIjin(String year);
  Future<ResponseIjinListModel> getListLembur(String year);
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
    // final formData = FormData({
    //   "title": requestCreateIjinMode.title,
    //   "type": requestCreateIjinMode.type,
    //   "time_start": requestCreateIjinMode.timeStart,
    //   "time_end": requestCreateIjinMode.timeEnd,
    //   "description": requestCreateIjinMode.description,
    //   'file': await d.MultipartFile.fromFile(file!.path,
    //       filename: file!.path.split('/').last),
    // });
    var bodyData = {
      "title": requestCreateIjinMode.title,
      "type": requestCreateIjinMode.type,
      "time_start": requestCreateIjinMode.timeStart,
      "time_end": requestCreateIjinMode.timeEnd,
      "description": requestCreateIjinMode.description,
      // "file": d.MultipartFile.fromFile(file!.path,
      //     filename: file!.path.split('/').last),
    };
    var response = await dioConfigure.dio.post(
      endpoints.ijin.ijin,
      // data: formData,
      data: bodyData,
      // data: jsonEncode(
      //   requestCreateIjinMode.toJson(),
      // ),
    );
    return ResponseCreateIjinModel.fromJson(response.data);
  }

  @override
  Future<ResponseIjinListModel> getListIjin(String year) async {
    // final userId = _userCredentialLocal.getUserCredentials().id;
    var response = await dioConfigure.dio.get(
      "${endpoints.ijin.ijin}?type=cuti,ijin&tahun=$year",
    );
    return ResponseIjinListModel.fromJson(response.data);
  }

  @override
  Future<ResponseIjinListModel> getListLembur(String year) async {
    // final userId = _userCredentialLocal.getUserCredentials().id;
    var response = await dioConfigure.dio.get(
      "${endpoints.ijin.ijin}?type=lembur&tahun=$year",
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
