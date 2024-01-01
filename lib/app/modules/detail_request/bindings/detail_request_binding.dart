import 'package:get/get.dart';

import '../controllers/detail_request_controller.dart';

class DetailRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRequestController>(
      () => DetailRequestController(),
    );
  }
}
