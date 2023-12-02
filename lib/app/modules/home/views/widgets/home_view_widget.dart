import 'package:asiagolf_app/app/modules/home/controllers/home_controller.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/item_log_absensi_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/modules/widgets/big_clock_widget.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Column(
            children: [
              const BigClockWidget(),
              SizedBox(
                height: 40.h,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Normal',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: secondaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '08:00 - 17:00',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWidget(
                            buttonColor: primaryButtonColor,
                            text: 'Clock In',
                            onTap: () {
                              controller.onClickClockIn();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ButtonWidget(
                            buttonColor: primaryButtonColor,
                            text: 'Clock Out',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Log Absensi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.onClickLogAbsenItem();
                          },
                          child: const ItemLogAbsensiWidget(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // ElevatedButton(
        //   onPressed: controller.onClickLogout,
        //   child: const Text('Logout'),
        // ),
      ],
    );
  }
}
