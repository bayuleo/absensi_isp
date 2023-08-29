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

  @override
  void onReady() {
    super.onReady();
  }

  void onChangedPage() {
    pageIndex = (pageController.page ?? 0).toInt();
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
