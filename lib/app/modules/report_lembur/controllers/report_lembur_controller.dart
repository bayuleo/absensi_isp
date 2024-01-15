import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/ijin/list/response_ijin_list_ijin_model.dart';

class ReportLemburController extends BaseController {
  ResponseIjinListIjinModel dummyData = const ResponseIjinListIjinModel(
    id: 1,
    title: "malam 2027",
    type: 'lembur',
    description: 'description',
    status: 'approve',
    timeStart: "28/12/2023 18:50",
    timeEnd: "28/12/2023 06:50",
    createdAt: '2023-12-28T13:28:03.761Z',
    updatedAt: '2023-12-28T13:28:03.761Z',
  );

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
