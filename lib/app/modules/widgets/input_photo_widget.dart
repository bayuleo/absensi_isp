import 'dart:io';

import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputPhotoWidget extends StatefulWidget {
  const InputPhotoWidget({
    super.key,
    required this.onSelectedImage,
  });

  final Function(String? path) onSelectedImage;

  @override
  State<InputPhotoWidget> createState() => _InputPhotoWidgetState();
}

class _InputPhotoWidgetState extends State<InputPhotoWidget> {
  XFile? photo;

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
                    onTap: () async {
                      var result = await Get.toNamed(Routes.CAMERA_PREVIEW);
                      photo = result;
                      widget.onSelectedImage(photo?.path);
                      setState(() {});
                    },
                  )
                : SizedBox(
                    width: double.infinity,
                    height: 400,
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
