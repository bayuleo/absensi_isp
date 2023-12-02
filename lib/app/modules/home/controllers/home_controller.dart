import 'package:asiagolf_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/logout.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/home_view_widget.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/lembur_view_widget.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/widgets/ijin_view_widget.dart';
import '../views/widgets/profile_view_widget.dart';

enum Status { pending, reject, approve }

class HomeController extends GetxController {
  int selectedScreen = 0;

  List<Widget> screen = <Widget>[
    HomeViewWidget(),
    LemburViewWidget(),
    IjinViewWidget(),
    ProfileViewWidget(),
  ];

  List<DropdownMenuItem> years = [];
  List<DropdownMenuItem> status = [
    DropdownMenuItem<String>(
      value: 'all',
      child: Text(
        'All',
      ),
    ),
    DropdownMenuItem<String>(
      value: 'pending',
      child: Text(
        'Pending',
      ),
    ),
    DropdownMenuItem<String>(
      value: 'reject',
      child: Text(
        'Reject',
      ),
    ),
    DropdownMenuItem<String>(
      value: 'approve',
      child: Text(
        'Approve',
      ),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    generateYearPicker();
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
    late LogoutUseCase logout;
    late Result<bool> result;

    logout = LogoutUseCase(authRepository: AuthRepositoryImpl());

    result = await logout.call(null);
    if (result.status is Success) {
      showSnack(result.message);
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void onClickClockIn() {
    Get.toNamed(Routes.DETAIL_CLOCK_IN);
  }

  void onClickLogAbsenItem() {
    Get.toNamed(Routes.DETAIL_ABSENSI);
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
}
