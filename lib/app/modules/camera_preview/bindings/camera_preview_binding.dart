import 'package:get/get.dart';

import '../controllers/camera_preview_controller.dart';

class CameraPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraPreviewController>(
      () => CameraPreviewController(),
    );
  }
}
