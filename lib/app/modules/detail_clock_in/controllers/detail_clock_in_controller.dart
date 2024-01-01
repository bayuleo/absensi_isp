import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/core/enum/absent_type.dart';
import 'package:asiagolf_app/app/core/utils/snackbar.dart';
import 'package:asiagolf_app/app/data/model/absent/response_absent_model.dart';
import 'package:asiagolf_app/app/data/remote/absent_data_source.dart';
import 'package:asiagolf_app/app/utils/location.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DetailClockInController extends BaseController {
  final _absentDataSource = Get.find<AbsentDataSource>();

  Position? position;
  MapController mapController = MapController();
  XFile? picture;
  bool isCaptured = false;
  AbsentType? absenMode;
  String? imagePath;

  TextEditingController descTextEditingController = TextEditingController();

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
  }

  void onClickSubmit() {
    showLoading();
    absenMode == AbsentType.checkIn ? ClockIn() : ClockOut();
    hideLoading();
  }

  void ClockIn() {
    callDataService<ResponseAbsentModel>(
      () => _absentDataSource.clockIn(
        longlat: '${position?.longitude},${position?.latitude}',
        desc: descTextEditingController.text.trim(),
        filePath: picture?.path,
      ),
      onSuccess: (res) {
        Get.back(result: true);
        SnackbarHelper.success(
          title: 'Berhasil',
          desc: 'Check In Berhasil',
        );
      },
    );
  }

  void ClockOut() {
    callDataService<ResponseAbsentModel>(
      () => _absentDataSource.clockOut(
        longlat: '${position!.longitude},${position!.latitude}',
        desc: descTextEditingController.text.trim(),
        filePath: picture?.path,
      ),
      onSuccess: (res) {
        Get.back(result: true);
        SnackbarHelper.success(
          title: 'Berhasil',
          desc: 'Check Out Berhasil',
        );
      },
    );
  }

  void onImageSelected(String? filePath) {
    imagePath = filePath;
  }
}
