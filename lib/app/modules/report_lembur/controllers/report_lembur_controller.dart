import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/ijin/byId/response_ijin_by_id_data_ijin_model.dart';

class ReportLemburController extends BaseController {
  ResponseIjinByIdDataIjinModel dummyData = const ResponseIjinByIdDataIjinModel(
      id: 70,
      title: "bayu ijin",
      type: "ijin",
      description: "ijin ga masuk",
      status: "pending",
      notes: "null",
      filename: "https://api.ccpmanagement.my.id/ijin/img/undefined",
      timeStart: "26/02/2024",
      timeEnd: "27/02/2024",
      createdAt: "2024-02-24T15:09:58.024Z",
      updatedAt: "2024-02-24T15:09:58.024Z");

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
