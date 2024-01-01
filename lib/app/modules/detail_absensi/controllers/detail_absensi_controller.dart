import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/absent/detail_absent/response_detail_absent_data_model.dart';
import 'package:asiagolf_app/app/data/model/absent/detail_absent/response_detail_absent_model.dart';
import 'package:asiagolf_app/app/data/remote/absent_data_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DetailAbsensiController extends BaseController {
  final _absentDataSource = Get.find<AbsentDataSource>();
  bool isLoading = false;
  MapController mapController = MapController();
  int idAbsent = 0;
  ResponseDetailAbsentDataModel? detailData;

  TextEditingController detailTextEditingController = TextEditingController();

  double lat = -6.1753016780023575;
  double lon = 106.82718040266958;

  @override
  void onInit() async {
    super.onInit();
    idAbsent = Get.arguments;
  }

  @override
  void onReady() async {
    super.onReady();
    getDataDetailAbsent();
    update();
  }

  @override
  void dispose() async {
    super.dispose();
    mapController.dispose();
    detailTextEditingController.dispose();
  }

  void onClickTitleClockIn() {
    // isShowClockIn = !isShowClockIn;
    // update();
  }

  // void onClickTitleClockOut() {
  //   isShowClockOut = !isShowClockOut;
  //   update();
  // }

  void getDataDetailAbsent() async {
    isLoading = true;
    update();

    await callDataService<ResponseDetailAbsentModel>(
      () => _absentDataSource.getDetailAbsen(idAbsent),
      onSuccess: (res) {
        detailData = res.data;
        detailTextEditingController.text = detailData?.description ?? '';
        var resLat = double.tryParse(detailData!.longlat!.split(',').last);
        var resLong = double.tryParse(detailData!.longlat!.split(',').first);
        if (resLat != null && resLong != null) {
          lat = resLat;
          lon = resLong;
          mapController.move(
            LatLng(
              resLat,
              resLong,
            ),
            16,
          );
        }
      },
    );

    isLoading = false;
    update();
  }
}
