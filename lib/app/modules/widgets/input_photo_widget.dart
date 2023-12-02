import 'dart:io';

import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class InputPhotoWidget extends StatelessWidget {
  const InputPhotoWidget({
    super.key,
    required this.controller,
    required this.onTap,
    this.photo,
  });

  final CameraController controller;
  final Function() onTap;
  final XFile? photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Foto',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Center(
            child: photo == null
                ? ButtonWidget(
                    isFill: false,
                    text: 'Ambil Gambar',
                    prefix: Icon(Icons.camera_alt_outlined),
                    onTap: onTap,
                  )
                : SizedBox(
                    width: double.infinity,
                    child: Image.file(
                      fit: BoxFit.cover,
                      File(photo!.path),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
