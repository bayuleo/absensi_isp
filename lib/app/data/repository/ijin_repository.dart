import 'package:asiagolf_app/app/data/model/ijin/response_ijin_model.dart';
import 'package:asiagolf_app/app/data/remote/ijin_data_source.dart';
import 'package:get/get.dart';

abstract class IjinRepository {
  Future<ResponseIjinModel> getCountIjin();
}

class IjinRepositoryImpl implements IjinRepository {
  final _ijinDataSource = Get.find<IjinDataSource>();

  @override
  Future<ResponseIjinModel> getCountIjin() async {
    final res = await _ijinDataSource.getCountIjin();
    return res;
  }
}
