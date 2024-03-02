import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/core/widgets/dialog/confirmation_dialog_widget.dart';
import 'package:asiagolf_app/app/data/model/admin/ijin/dashboard_ijin_data_model.dart';
import 'package:asiagolf_app/app/data/model/admin/ijin/dashboard_ijin_model.dart';
import 'package:asiagolf_app/app/data/remote/admin_data_source.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/local/user_credentials_data_source.dart';
import '../../../data/model/admin/dashboard_absent_data_model.dart';
import '../../../data/model/admin/dashboard_absent_model.dart';

class HomeAdminController extends BaseController {
  final _userCredentialLocal = Get.find<UserCredentialsDataSource>();
  final _adminDataSource = Get.find<AdminDataSource>();

  DashboardAbsentDataModel? dashboardAbsentData;
  DashboardIjinDataModel? dashboardIjinData;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getAbsentCountData();
    getIjinCountData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

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

  Future<void> getAbsentCountData() async {
    await callDataService<DashboardAbsentModel>(
      () => _adminDataSource.getDashboardAbsent(),
      loading: false,
      onSuccess: (res) {
        dashboardAbsentData = res.data;
      },
    );
    update();
  }

  Future<void> getIjinCountData() async {
    await callDataService<DashboardIjinModel>(
      () => _adminDataSource.getDashboardIjin(),
      loading: false,
      onSuccess: (res) {
        dashboardIjinData = res.data;
      },
    );
    update();
  }
}
