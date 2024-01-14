import 'package:asiagolf_app/app/core/enum/absent_type.dart';
import 'package:asiagolf_app/app/modules/widgets/map_widget.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/views/widget/text_field_with_label_widget.dart';
import '../../splash/views/widget/button_widget.dart';
import '../../widgets/big_clock_widget.dart';
import '../../widgets/input_photo_widget.dart';
import '../controllers/detail_clock_in_controller.dart';

class DetailClockInView extends GetView<DetailClockInController> {
  const DetailClockInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailClockInController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: primaryColor,
                  padding: const EdgeInsets.only(
                    top: 60,
                    bottom: 20,
                  ),
                  width: double.infinity,
                  child: const BigClockWidget(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.absenMode == AbsentType.checkIn
                            ? 'Clock In'
                            : 'Clock Out',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      MapWidget(
                        mapController: controller.mapController,
                        latitude: controller.position?.latitude,
                        longitude: controller.position?.longitude,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldWithLabelWidget(
                        label: "Deskripsi",
                        hint: "Deskripsi",
                        controller: controller.descTextEditingController,
                        keyboardType: TextInputType.text,
                        minLines: 3,
                        maxLines: 5,
                        // validator: emailRequired,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InputPhotoWidget(
                        onSelectedImage: (photoPath) {
                          controller.onImageSelected(photoPath);
                        },
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ButtonWidget(
                        isLoading: controller.isLoading,
                        text: controller.absenMode == AbsentType.checkIn
                            ? 'Clock In'
                            : 'Clock Out',
                        onTap: () {
                          controller.onClickSubmit();
                        },
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
