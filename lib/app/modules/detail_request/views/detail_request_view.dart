import 'package:asiagolf_app/app/modules/detail_request/views/widgets/loading_detail_request_widget.dart';
import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/modules/widgets/input_photo_widget.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:asiagolf_app/app/utils/validation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/detail_request_controller.dart';

class DetailRequestView extends GetView<DetailRequestController>
    with Validation {
  const DetailRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailRequestController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
                '${controller.isCreatePage ? 'Pengajuan' : 'Detail'} ${controller.requestType == RequestType.lembur ? 'Lembur' : 'Ijin'}'),
            centerTitle: true,
            backgroundColor: primaryColor,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.requestKey,
              child: controller.isLoadingGetData
                  ? LoadingDetailRequestWidget()
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            controller.isLoadingGetData
                                ? SizedBox(
                                    width: double.infinity,
                                    height: 20,
                                  )
                                : TextFieldWithLabelWidget(
                                    label: controller.requestType ==
                                            RequestType.lembur
                                        ? "Judul Lembur"
                                        : "Judul Ijin",
                                    hint: controller.requestType ==
                                            RequestType.lembur
                                        ? "Judul Lembur"
                                        : "Judul Ijin",
                                    controller:
                                        controller.titleTextEditingController,
                                    keyboardType: TextInputType.text,
                                    readOnly: !controller.isCreatePage,
                                    validator: inputRequired,
                                  ),
                            SizedBox(
                              height: 16,
                            ),
                            if (controller.requestType == RequestType.ijin)
                              Text(
                                'Jenis',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor,
                                ),
                              ),
                            if (controller.requestType == RequestType.ijin)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 'cuti',
                                        groupValue: controller.type,
                                        onChanged: (value) {
                                          if (controller.isCreatePage)
                                            controller.onSelectedRadio(value!);
                                        },
                                      ),
                                      Text('Cuti'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 'ijin',
                                        groupValue: controller.type,
                                        onChanged: (value) {
                                          if (controller.isCreatePage)
                                            controller.onSelectedRadio(value!);
                                        },
                                      ),
                                      Text('Ijin'),
                                    ],
                                  ),
                                ],
                              ),
                            if (controller.requestType == RequestType.ijin)
                              SizedBox(
                                height: 16,
                              ),
                            TextFieldWithLabelWidget(
                              label: "Tanggal Mulai",
                              hint: "Tanggal Mulai",
                              controller:
                                  controller.dateStartTextEditingController,
                              readOnly: true,
                              onTap: () async {
                                if (controller.isCreatePage) {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  ).then((selectedDate) {
                                    if (selectedDate != null) {
                                      if (controller.requestType ==
                                          RequestType.lembur) {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((selectedTime) {
                                          // Handle the selected date and time here.
                                          if (selectedTime != null) {
                                            DateTime selectedDateTime =
                                                DateTime(
                                              selectedDate.year,
                                              selectedDate.month,
                                              selectedDate.day,
                                              selectedTime.hour,
                                              selectedTime.minute,
                                            );
                                            controller.onSelectedStartDate(
                                                selectedDateTime!);
                                          }
                                        });
                                      } else {
                                        controller
                                            .onSelectedStartDate(selectedDate!);
                                      }
                                    }
                                  });
                                }
                              },
                              validator: inputRequired,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFieldWithLabelWidget(
                              label: "Tanggal Berakhir",
                              hint: "Tanggal Berakhir",
                              controller:
                                  controller.dateEndTextEditingController,
                              readOnly: true,
                              onTap: () async {
                                if (controller.isCreatePage) {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  ).then((selectedDate) {
                                    if (selectedDate != null) {
                                      if (controller.requestType ==
                                          RequestType.lembur) {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((selectedTime) {
                                          // Handle the selected date and time here.
                                          if (selectedTime != null) {
                                            DateTime selectedDateTime =
                                                DateTime(
                                              selectedDate.year,
                                              selectedDate.month,
                                              selectedDate.day,
                                              selectedTime.hour,
                                              selectedTime.minute,
                                            );
                                            controller.onSelectedEndDate(
                                                selectedDateTime!);
                                          }
                                        });
                                      } else {
                                        controller
                                            .onSelectedEndDate(selectedDate!);
                                      }
                                    }
                                  });
                                }
                              },
                              validator: inputRequired,
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
                              readOnly: !controller.isCreatePage,
                              validator: inputRequired,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            controller.isCreatePage
                                ? InputPhotoWidget(
                                    onSelectedImage: (photoPath) {
                                      controller.onImageSelected(photoPath);
                                    },
                                  )
                                : Center(
                                    child: CachedNetworkImage(
                                      width: double.infinity,
                                      height: 300.h,
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          controller.detailData?.filename ?? '',
                                      placeholder: (context, url) =>
                                          Lottie.asset(
                                        'assets/lottie/loading_image.json',
                                        repeat: true,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.error),
                                          Text("Failed load image")
                                        ],
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 40,
                            ),
                            if (controller.isCreatePage)
                              ButtonWidget(
                                text:
                                    controller.requestType == RequestType.lembur
                                        ? "Request Lembur"
                                        : "Request Ijin",
                                isLoading: controller.isLoading,
                                onTap: () {
                                  controller.onConfirm();
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
