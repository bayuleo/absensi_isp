import 'dart:io';

import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/camera_preview_controller.dart';

class CameraPreviewView extends GetView<CameraPreviewController> {
  const CameraPreviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraPreviewController>(
      builder: (controller) {
        return Stack(
          children: [
            if (controller.cameraReady)
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: 100,
                    child: controller.isCaptured
                        ? Image.file(File(controller.picture!.path))
                        : CameraPreview(controller.cameraController!),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: controller.isCaptured
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.onCancel();
                            },
                            child: Icon(
                              Icons.cancel_outlined,
                              size: 80.w,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.onConfirm();
                            },
                            child: Icon(
                              Icons.check_circle_outline,
                              size: 80.w,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.onCapture();
                        },
                        child: Icon(
                          Icons.radio_button_checked,
                          size: 80.w,
                          color: Colors.white,
                        ),
                      ),
              ),
            )
          ],
        );
      },
    );
  }
}
