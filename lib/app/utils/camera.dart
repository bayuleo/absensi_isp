import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  const Camera({
    super.key,
    required this.controller,
  });

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    return CameraPreview(controller);
  }
}
