import 'package:asiagolf_app/app/modules/assets/button/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashView'),
        centerTitle: true,
      ),
      body: GetBuilder<SplashController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 68,
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
                    const SizedBox(
                      height: 64,
                    ),
                    controller.pageIndex == 0
                        ? ButtonWidget(
                            widget: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            width: 54,
                            pd: const EdgeInsets.all(16),
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
                                width: 54,
                                pd: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
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
                                pd: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 14),
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

class SlideScreenWidget extends StatelessWidget {
  final String assets;
  final String title;
  final String desc;
  const SlideScreenWidget({
    required this.assets,
    required this.title,
    required this.desc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          assets,
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
