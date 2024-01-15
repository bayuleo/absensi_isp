import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/core/enum/absent_type.dart';
import 'package:asiagolf_app/app/core/widgets/dialog/confirmation_dialog_widget.dart';
import 'package:asiagolf_app/app/data/local/user_credentials_data_source.dart';
import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/data/remote/absent_data_source.dart';
import 'package:asiagolf_app/app/data/remote/ijin_data_source.dart';
import 'package:asiagolf_app/app/data/remote/users_data_source.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/home_view_widget.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/lembur_view_widget.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/enum/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../views/widgets/ijin_view_widget.dart';
import '../views/widgets/profile_view_widget.dart';

class HomeController extends BaseController {
  final _userCredentialLocal = Get.find<UserCredentialsDataSource>();
  final _usersDataSource = Get.find<UsersDataSource>();
  final _ijinDataSource = Get.find<IjinDataSource>();
  final _absentDataSource = Get.find<AbsentDataSource>();
  int selectedScreen = 0;

  //Filter
  String yearLembur = DateFormat('yyyy').format(DateTime.now());
  String yearIjin = DateFormat('yyyy').format(DateTime.now());
  String statusLembur = StatusRequest.all.value;
  String statusIjin = StatusRequest.all.value;

  ResponseUsersDataModel? profileData;
  ResponseIjinCountModel? lemburCountData;
  ResponseIjinCountModel? ijinCountData;
  ResponseIjinListModel? listIjin;
  ResponseIjinListModel? listLembur;
  ResponseAbsentDataModel? absentDataModel;

  RefreshController homeRefreshController =
      RefreshController(initialRefresh: false);
  RefreshController lemburRefreshController =
      RefreshController(initialRefresh: false);
  RefreshController ijinRefreshController =
      RefreshController(initialRefresh: false);
  RefreshController profileRefreshController =
      RefreshController(initialRefresh: false);

  bool isLoadingAbsent = false;
  bool isLoadingLembur = false;
  bool isLoadingIjin = false;
  bool isLoadingCountLembur = false;
  bool isLoadingCountIjin = false;

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
  void onInit() async {
    super.onInit();
    generateYearPicker();
    getProfile();
    getCountLembur();
    getCountIjin();
    getAbsent();
    getListLembur();
    getListIjin();
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
    super.dispose();
    homeRefreshController.dispose();
    lemburRefreshController.dispose();
    ijinRefreshController.dispose();
    profileRefreshController.dispose();
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

  void onClickClockIn() async {
    var result = await Get.toNamed(
      Routes.DETAIL_CLOCK_IN,
      arguments: AbsentType.checkIn,
    );
    if (result) {
      Future.delayed(
        Duration(seconds: 3),
      );
      getAbsent();
    }
  }

  void onClickClockOut() async {
    var result = await Get.toNamed(
      Routes.DETAIL_CLOCK_IN,
      arguments: AbsentType.checkOut,
    );
    if (result) {
      Future.delayed(
        Duration(seconds: 3),
      );
      getAbsent();
    }
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
      var value = ((currentYear + 1) - i).toString();
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
    getCountLembur();
    getListLembur();
    update();
  }

  void onChangeYearIjin(String selected) {
    yearIjin = selected;
    getCountIjin();
    getListIjin();
    update();
  }

  void onChangeStatusLembur(String selected) {
    statusLembur = selected;
    getListLembur();
    update();
  }

  void onChangeStatusIjin(String selected) {
    statusIjin = selected;
    getListIjin();
    update();
  }

  void getCountLembur([bool isRefresh = false]) async {
    if (!isRefresh) {
      isLoadingCountLembur = true;
    }
    update();

    await callDataService<ResponseIjinCountModel>(
      () => _ijinDataSource.getCountLembur(yearLembur),
      onSuccess: (res) {
        lemburCountData = res;
        update();
      },
    );

    isLoadingCountLembur = false;
    update();
  }

  void getCountIjin([bool isRefresh = false]) async {
    if (!isRefresh) {
      isLoadingCountIjin = true;
    }
    update();

    await callDataService<ResponseIjinCountModel>(
      () => _ijinDataSource.getCountIjin(yearIjin),
      onSuccess: (res) {
        ijinCountData = res;
        update();
      },
    );

    isLoadingCountIjin = false;
    update();
  }

  void getProfile() {
    callDataService<ResponseUsersModel>(
      () => _usersDataSource.getProfile(),
      onSuccess: (res) {
        profileData = res.data;
        update();
      },
    );

    profileRefreshController.refreshCompleted();
    update();
  }

  void getAbsent([bool isRefresh = false]) async {
    if (!isRefresh) {
      isLoadingAbsent = true;
    }
    update();

    await callDataService<ResponseAbsentModel>(
      () => _absentDataSource.getMyAbsent(),
      onSuccess: (res) {
        absentDataModel = res.data;
        update();
      },
    );

    isLoadingAbsent = false;
    homeRefreshController.refreshCompleted();
    update();
  }

  void getListLembur([bool isRefresh = false]) async {
    if (!isRefresh) {
      isLoadingLembur = true;
    }
    update();

    await callDataService<ResponseIjinListModel>(
      () => _ijinDataSource.getListLembur(yearLembur, statusLembur),
      onSuccess: (res) {
        listLembur = res;
      },
    );

    isLoadingLembur = false;
    lemburRefreshController.refreshCompleted();
    update();
  }

  void getListIjin([bool isRefresh = false]) async {
    if (!isRefresh) {
      isLoadingIjin = true;
    }
    update();

    await callDataService<ResponseIjinListModel>(
      () => _ijinDataSource.getListIjin(yearIjin, statusIjin),
      onSuccess: (res) {
        listIjin = res;
      },
    );

    isLoadingIjin = false;
    ijinRefreshController.refreshCompleted();
    update();
  }
}
