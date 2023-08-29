import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../controllers/splash_controller.dart';
import 'widget/slide_screen_widget.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder: (controller) => Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: 50.w,
          ),
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 6,
                child: PageView(
                  controller: controller.pageController,
                  children: const [
                    SlideScreenWidget(
                      assets: 'assets/icons/splash_woman.svg',
                      title: 'Beli Peralatan Golf Dengan Mudah di AsiaGolf',
                      desc:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    ),
                    SlideScreenWidget(
                      assets: 'assets/icons/splash_golf.svg',
                      title: 'Beli Peralatan Golf Dengan Mudah di AsiaGolf',
                      desc:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    ),
                    SlideScreenWidget(
                      assets: 'assets/icons/splash_hockey.svg',
                      title: 'Beli Peralatan Golf Dengan Mudah di AsiaGolf',
                      desc:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    PageViewDotIndicator(
                      currentItem: controller.pageIndex,
                      count: 3,
                      unselectedColor: Colors.black12,
                      selectedColor: const Color(0xff369B43),
                    ),
                    SizedBox(
                      height: 64.h,
                    ),
                    controller.pageIndex == 0
                        ? ButtonWidget(
                            widget: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            width: 54.w,
                            pd: EdgeInsets.all(16.w),
                            mg: EdgeInsets.zero,
                            onTap: controller.onTapButtonNext,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonWidget(
                                widget: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                buttonColor: const Color(0x662E398F),
                                width: 54.w,
                                pd: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 16.w,
                                ),
                                mg: EdgeInsets.zero,
                                onTap: controller.onTapButtonBack,
                              ),
                              ButtonWidget(
                                text: 'Next',
                                fontSize: 20.sp,
                                tail: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                                width: 140.w,
                                pd: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                mg: const EdgeInsets.symmetric(horizontal: 12),
                                onTap: controller.onTapButtonNext,
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
