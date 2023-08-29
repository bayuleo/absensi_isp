import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  int pageIndex = 0;
  final pageController = PageController();

  @override
  void onInit() {
    pageController.addListener(onChangedPage);
    super.onInit();
  }

  void onChangedPage() {
    pageIndex = (pageController.page ?? 0).toInt();
    update();
  }

  void onTapButtonNext() {
    if (pageIndex < 2) {
      pageController.animateToPage(pageIndex + 1,
          duration: const Duration(milliseconds: 250), curve: Curves.linear);
      update();
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }

  void onTapButtonBack() {
    pageIndex--;
    pageController.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
