import 'package:get/get.dart';

import '../controllers/detail_clock_in_controller.dart';

class DetailClockInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailClockInController>(
      () => DetailClockInController(),
    );
  }
}
