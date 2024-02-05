import 'dart:io';

import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/core/enum/absent_type.dart';
import 'package:asiagolf_app/app/core/extention/dater_helper.dart';
import 'package:asiagolf_app/app/core/utils/snackbar.dart';
import 'package:asiagolf_app/app/data/model/absent/response_absent_model.dart';
import 'package:asiagolf_app/app/data/remote/absent_data_source.dart';
import 'package:asiagolf_app/app/utils/location.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DetailClockInController extends BaseController {
  final _absentDataSource = Get.find<AbsentDataSource>();
  final clockInKey = GlobalKey<FormState>();

  Position? position;
  MapController mapController = MapController();
  XFile? picture;
  bool isCaptured = false;
  bool isLoading = false;
  bool isManualMode = false;
  AbsentType? absenMode;
  String? imagePath;
  DateTime? manualSelectedDate;

  TextEditingController descTextEditingController = TextEditingController();
  TextEditingController inputTimeManualController = TextEditingController();

  String workingMode = '';
  List<DropdownMenuItem> workingTime = [
    const DropdownMenuItem<String>(
      value: '1',
      child: Text('Shift Pagi (07.00 - 14.00)'),
    ),
    const DropdownMenuItem<String>(
      value: '2',
      child: Text('Shift Siang (13.00 - 21.00)'),
    ),
    const DropdownMenuItem<String>(
      value: '3',
      child: Text('Shift Malam (20.00 - 07.00)'),
    ),
  ];

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    absenMode = Get.arguments;
    update();
  }

  @override
  void onReady() async {
    super.onReady();
    position = await getPosition();
    mapController.move(
      LatLng(
        position!.latitude,
        position!.longitude,
      ),
      18,
    );
    update();
  }

  @override
  void onClose() {
    super.onClose();
    mapController.dispose();
    descTextEditingController.dispose();
    inputTimeManualController.dispose();
  }

  void onClickSubmit() {
    FocusScope.of(Get.context!).unfocus();
    if (clockInKey.currentState!.validate()) {
      showLoading();
      absenMode == AbsentType.checkIn ? ClockIn() : ClockOut();
      hideLoading();
    }
  }

  void ClockIn() {
    isLoading = true;
    update();
    callDataService<ResponseAbsentModel>(
      () => _absentDataSource.clockIn(
        longlat: '${position?.longitude},${position?.latitude}',
        desc: descTextEditingController.text.trim(),
        image: imagePath != null ? File(imagePath!) : null,
        isManual: isManualMode,
        shift: workingMode,
        manualTime: inputTimeManualController.text.trim(),
      ),
      onSuccess: (res) {
        Get.back(result: true);
        SnackbarHelper.success(
          title: 'Berhasil',
          desc: 'Check In Berhasil',
        );
      },
    );

    isLoading = false;
    update();
  }

  void ClockOut() {
    isLoading = true;
    update();

    callDataService<ResponseAbsentModel>(
      () => _absentDataSource.clockOut(
        longlat: '${position!.longitude},${position!.latitude}',
        desc: descTextEditingController.text.trim(),
        image: imagePath != null ? File(imagePath!) : null,
        isManual: isManualMode,
        shift: workingMode,
        manualTime: inputTimeManualController.text.trim(),
      ),
      onSuccess: (res) {
        Get.back(result: true);
        SnackbarHelper.success(
          title: 'Berhasil',
          desc: 'Check Out Berhasil',
        );
      },
    );

    isLoading = false;
    update();
  }

  void onImageSelected(String? filePath) {
    imagePath = filePath;
  }

  void onSelectedWorkingTime(String value) {
    workingMode = value;
    update();
  }

  void onTapSwitchMode(int index) {
    if (index == 0) {
      isManualMode = false;
    } else {
      isManualMode = true;
    }
    update();
  }

  void onInputManualDate(DateTime value) {
    manualSelectedDate = value;
    inputTimeManualController.text = value.toSimpleString('dd/MM/yyyy HH:mm')!;
    update();
  }
}
