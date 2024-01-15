import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/absent/response_absent_data_absent_model.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ReportAbsensiController extends BaseController {
  ResponseAbsentDataAbsentModel dummyData = ResponseAbsentDataAbsentModel(
    id: 1,
    date: "2023-12-18T14:05:58.000Z",
    time: '08.00',
    type: 'type',
    description: 'description',
    longlat: 'longlat',
    path: 'path',
    filename: 'filename',
    mimetype: 'mimetype',
    createdAt: "2023-12-18T14:05:58.000Z",
    updatedAt: "2023-12-18T14:05:58.000Z",
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

  void onClickLogAbsenItem(int? id) {
    Get.toNamed(
      Routes.DETAIL_ABSENSI,
      arguments: id,
    );
    // Get.toNamed(Routes.TEST);
  }
}
