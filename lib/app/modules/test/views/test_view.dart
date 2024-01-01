import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/test_controller.dart';

class TestView extends GetView<TestController> {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InkWell(
            //   onTap: () {},
            //   child: Text("Button"),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            GestureDetector(
              onTap: () {
                controller.onCLick();
              },
              child: Text('test'),
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: FlutterMap(
                mapController: controller.controller,
                options: MapOptions(
                  initialCenter: LatLng(controller.lat, controller.lon),
                  initialZoom: 12,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
