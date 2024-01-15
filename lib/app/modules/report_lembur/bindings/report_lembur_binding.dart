import 'package:get/get.dart';

import '../controllers/report_lembur_controller.dart';

class ReportLemburBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportLemburController>(
      () => ReportLemburController(),
    );
  }
}
