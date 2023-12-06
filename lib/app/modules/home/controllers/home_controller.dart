import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/core/widgets/dialog/confirmation_dialog_widget.dart';
import 'package:asiagolf_app/app/data/local/user_credentials_data_source.dart';
import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/data/remote/ijin_data_source.dart';
import 'package:asiagolf_app/app/data/remote/users_data_source.dart';
import 'package:asiagolf_app/app/modules/detail_clock_in/controllers/detail_clock_in_controller.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/home_view_widget.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/lembur_view_widget.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/enum/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/widgets/ijin_view_widget.dart';
import '../views/widgets/profile_view_widget.dart';

class HomeController extends BaseController {
  final _userCredentialLocal = Get.find<UserCredentialsDataSource>();
  final _usersDataSource = Get.find<UsersDataSource>();
  final _ijinDataSource = Get.find<IjinDataSource>();
  int selectedScreen = 0;

  //Filter
  String yearLembur = '2023';
  String yearIjin = '2023';
  String statusLembur = StatusRequest.all.value;
  String statusIjin = StatusRequest.all.value;

  ResponseUsersDataModel? profileData;
  ResponseIjinDataModel? ijinCountData;

  List<Widget> screen = <Widget>[
    HomeViewWidget(),
    LemburViewWidget(),
    IjinViewWidget(),
    ProfileViewWidget(),
  ];

  List<DropdownMenuItem> years = [];
  List<DropdownMenuItem> status = [
    DropdownMenuItem<String>(
      value: StatusRequest.all.value,
      child: Text(
        StatusRequest.all.value,
      ),
    ),
    DropdownMenuItem<String>(
      value: StatusRequest.pending.value,
      child: Text(
        StatusRequest.pending.value,
      ),
    ),
    DropdownMenuItem<String>(
      value: StatusRequest.reject.value,
      child: Text(
        StatusRequest.reject.value,
      ),
    ),
    DropdownMenuItem<String>(
      value: StatusRequest.approve.value,
      child: Text(
        StatusRequest.approve.value,
      ),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    generateYearPicker();
    getProfile();
    getCountIjin();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onClickLogout() async {
    Get.dialog(
      ConfirmDialogWidget(
        title: 'Keluar Aplikasi',
        content: 'Apakah anda yakin ingin keluar dari aplikasi ?',
        onConfirm: () async {
          Get.back();
          // await _signOut(); //TODO integrate logout
          _userCredentialLocal.clearToken();
          Get.offAllNamed(Routes.LOGIN);
        },
        onCancel: () {
          Get.back();
        },
      ),
    );
  }

  void onClickClockIn() {
    Get.toNamed(
      Routes.DETAIL_CLOCK_IN,
      arguments: AbsenMode.ClockIn,
    );
  }

  void onClickClockOut() {
    Get.toNamed(
      Routes.DETAIL_CLOCK_IN,
      arguments: AbsenMode.ClockOut,
    );
  }

  void onClickLogAbsenItem() {
    Get.toNamed(
      Routes.DETAIL_ABSENSI,
    );
  }

  void onTapBottomMenu(int index) {
    print(index);
    selectedScreen = index;
    update();
  }

  void generateYearPicker() {
    var currentYear = DateTime.now().year;
    List<DropdownMenuItem> result = [];
    for (int i = 0; i < 6; i++) {
      var value = (currentYear - i).toString();
      result.add(
        DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        ),
      );
    }
    years = result;
    update();
  }

  void onChangeYearLembur(String selected) {
    yearLembur = selected;
    update();
  }

  void onChangeYearIjin(String selected) {
    yearIjin = selected;
    update();
  }

  void onChangeStatusLembur(String selected) {
    statusLembur = selected;
    update();
  }

  void onChangeStatusIjin(String selected) {
    statusIjin = selected;
    update();
  }

  void getCountIjin() {
    callDataService<ResponseIjinModel>(
      () => _ijinDataSource.getCountIjin(),
      onSuccess: (res) {
        ijinCountData = res.data;
        update();
      },
    );
  }

  void getProfile() {
    callDataService<ResponseUsersModel>(
      () => _usersDataSource.getProfile(),
      onSuccess: (res) {
        profileData = res.data;
        update();
      },
    );
  }
}
