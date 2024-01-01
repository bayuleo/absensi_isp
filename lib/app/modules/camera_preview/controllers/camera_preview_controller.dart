import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraPreviewController extends GetxController {
  //TODO: Implement CameraPreviewController

  late List<CameraDescription> _cameras;

  CameraController? cameraController;
  XFile? picture;
  bool isCaptured = false;
  bool cameraReady = false;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    _cameras = await availableCameras();
    cameraController = CameraController(_cameras.first, ResolutionPreset.high);
    cameraController?.initialize().then((value) {
      cameraReady = true;
      update();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    cameraController?.dispose();
  }

  void increment() => count.value++;

  void onCapture() async {
    picture = await cameraController?.takePicture();
    if (picture != null) {
      isCaptured = true;
    }
    update();
  }

  void onCancel() {
    isCaptured = false;
    update();
  }

  void onConfirm() {
    Get.back(result: picture);
  }
}
