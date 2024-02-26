import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/data/remote/absent_data_source.dart';
import 'package:asiagolf_app/app/data/remote/ijin_data_source.dart';
import 'package:asiagolf_app/app/utils/enum/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserDetailController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final _ijinDataSource = Get.find<IjinDataSource>();
  final _absentDataSource = Get.find<AbsentDataSource>();

  final count = 0.obs;
  late TabController tabController;
  ResponseListUsersDataModel? userData;
  ResponseIjinByIdModel? listIjin;
  ResponseIjinByIdModel? listLembur;
  ResponseAbsentDataModel? absentDataModel;
  String statusIjin = StatusRequest.all.value;

  String yearIjin = DateFormat('yyyy').format(DateTime.now());

  @override
  void onInit() {
    super.onInit();
    userData = Get.arguments;
    getListIjin();
    getListLembur();
    getAbsent();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void getListIjin([bool isRefresh = false]) async {
    await callDataService<ResponseIjinByIdModel>(
      () => _ijinDataSource.getListIjinById(
        yearIjin,
        statusIjin,
        userData!.id.toString(),
      ),
      onSuccess: (res) {
        listIjin = res;
      },
    );
    update();
  }

  void getListLembur([bool isRefresh = false]) async {
    await callDataService<ResponseIjinByIdModel>(
      () => _ijinDataSource.getListLemburById(
        yearIjin,
        statusIjin,
        userData!.id.toString(),
      ),
      onSuccess: (res) {
        listLembur = res;
      },
    );
    update();
  }

  void getAbsent([bool isRefresh = false]) async {
    await callDataService<ResponseAbsentModel>(
      () => _absentDataSource.getAbsentById(userData!.id.toString()),
      onSuccess: (res) {
        absentDataModel = res.data;
        update();
      },
    );
    update();
  }
}
