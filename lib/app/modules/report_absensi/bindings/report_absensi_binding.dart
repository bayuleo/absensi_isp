import 'package:get/get.dart';

import '../controllers/report_absensi_controller.dart';

class ReportAbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportAbsensiController>(
      () => ReportAbsensiController(),
    );
  }
}
