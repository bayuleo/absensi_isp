import 'package:asiagolf_app/app/core/enum/absent_type.dart';
import 'package:asiagolf_app/app/modules/widgets/map_widget.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:asiagolf_app/app/utils/validation.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../login/views/widget/text_field_with_label_widget.dart';
import '../../splash/views/widget/button_widget.dart';
import '../../widgets/big_clock_widget.dart';
import '../../widgets/input_photo_widget.dart';
import '../controllers/detail_clock_in_controller.dart';

class DetailClockInView extends GetView<DetailClockInController>
    with Validation {
  const DetailClockInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailClockInController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Form(
              key: controller.clockInKey,
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
                  if (controller.isManualMode)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          color: Colors.orange),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 12.sp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Flexible(
                            child: Text(
                              'Mode manual, anda perlu memasukan waktu absen secara manual, dan memerlukan approval dari admin. Diperuntukan untuk lupa absen.',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.absenMode == AbsentType.checkIn
                                  ? 'Clock In'
                                  : 'Clock Out',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ToggleSwitch(
                              minWidth: 60.0,
                              minHeight: 24.0,
                              cornerRadius: 40.0,
                              activeBgColors: const [
                                [primaryColor],
                                [Colors.orange]
                              ],
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              initialLabelIndex:
                                  controller.isManualMode ? 1 : 0,
                              totalSwitches: 2,
                              labels: const ['Auto', 'Manual'],
                              radiusStyle: true,
                              customTextStyles: [
                                TextStyle(
                                  fontSize: 12.sp,
                                ),
                                TextStyle(
                                  fontSize: 12.sp,
                                )
                              ],
                              onToggle: (index) {
                                controller.onTapSwitchMode(index!);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        MapWidget(
                          mapController: controller.mapController,
                          latitude: controller.position?.latitude,
                          longitude: controller.position?.longitude,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (controller.isManualMode)
                          Column(
                            children: [
                              TextFieldWithLabelWidget(
                                label: "Waktu Absen",
                                hint: "Masukan Waktu Absen",
                                controller:
                                    controller.inputTimeManualController,
                                readOnly: true,
                                validator: inputRequired,
                                onTap: () async {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  ).then((selectedDate) {
                                    if (selectedDate != null) {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((selectedTime) {
                                        // Handle the selected date and time here.
                                        if (selectedTime != null) {
                                          DateTime selectedDateTime = DateTime(
                                            selectedDate.year,
                                            selectedDate.month,
                                            selectedDate.day,
                                            selectedTime.hour,
                                            selectedTime.minute,
                                          );
                                          controller.onInputManualDate(
                                            selectedDateTime,
                                          );
                                        }
                                      });
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        const Text(
                          'Jam Kerja',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField2(
                          items: controller.workingTime,
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          hint: const Text(
                            'Pilih Jam Kerja',
                            style: TextStyle(fontSize: 14),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return '    Pilih Jam Kerja';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            controller.onSelectedWorkingTime(value);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWithLabelWidget(
                          label: "Deskripsi",
                          hint: "Deskripsi",
                          controller: controller.descTextEditingController,
                          keyboardType: TextInputType.text,
                          minLines: 3,
                          maxLines: 5,
                          validator: inputRequired,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        InputPhotoWidget(
                          onSelectedImage: (photoPath) {
                            controller.onImageSelected(photoPath);
                          },
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        controller.isManualMode
                            ? ButtonWidget(
                                isLoading: controller.isLoading,
                                text: controller.absenMode == AbsentType.checkIn
                                    ? 'Request Manual Clock In'
                                    : 'Request Manual Clock Out',
                                onTap: () {
                                  controller.onClickSubmit();
                                },
                              )
                            : ButtonWidget(
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
          ),
        );
      },
    );
  }
}
