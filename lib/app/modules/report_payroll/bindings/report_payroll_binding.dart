import 'package:get/get.dart';

import '../controllers/report_payroll_controller.dart';

class ReportPayrollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportPayrollController>(
      () => ReportPayrollController(),
    );
  }
}
