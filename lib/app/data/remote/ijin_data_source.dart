import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/network/dio_config.dart';
import 'package:asiagolf_app/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class IjinDataSource {
  Future<ResponseIjinModel> getCountIjin();
}

class IjinDataSourceImpl implements IjinDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseIjinModel> getCountIjin() async {
    var response = await dioConfigure.dio.get(
      endpoints.ijin.countIjin,
    );
    return ResponseIjinModel.fromJson(response.data);
  }
}
