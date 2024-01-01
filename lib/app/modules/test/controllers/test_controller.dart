import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class TestController extends GetxController {
  //TODO: Implement TestController

  double lon = -0.128928;
  double lat = 51.509364;

  MapController controller = MapController();

  final count = 0.obs;
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

  void onCLick() {
    lat = -7.999289396789156;
    lon = 112.59937039604478;
    controller.move(LatLng(lat, lon), 9);
    update();
  }

  void increment() => count.value++;
}
