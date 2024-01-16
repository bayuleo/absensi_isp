import 'package:asiagolf_app/app/modules/home/controllers/home_controller.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/item_log_absensi_widget.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/loading_item_request_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/modules/widgets/big_clock_widget.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
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
                          'Shift Pagi',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: secondaryTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          '07:00 - 14:00',
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
                                onTap: () {
                                  controller.onClickClockOut();
                                },
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
                    !controller.isLoadingAbsent &&
                            (controller.absentDataModel?.absent.length == 0 ||
                                controller.absentDataModel?.absent.length ==
                                    null)
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 100.h),
                              child: Column(
                                children: [
                                  Lottie.asset(
                                    'assets/lottie/empty_state.json',
                                    repeat: false,
                                  ),
                                  Text(
                                    'Tidak ada data absensi',
                                    style: TextStyle(
                                      color: secondaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: SmartRefresher(
                              controller: controller.homeRefreshController,
                              onRefresh: () {
                                controller.getAbsent(true);
                              },
                              child: ListView.builder(
                                physics: const ScrollPhysics(),
                                itemCount: controller.isLoadingAbsent
                                    ? 8
                                    : controller
                                            .absentDataModel?.absent.length ??
                                        0,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  if (controller.isLoadingAbsent) {
                                    return LoadingItemRequestWidget();
                                  }
                                  final data =
                                      controller.absentDataModel?.absent[index];
                                  return ItemLogAbsensiWidget(data: data);
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
      },
    );
  }
}
