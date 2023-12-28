import 'package:asiagolf_app/app/modules/detail_request/controllers/detail_request_controller.dart';
import 'package:asiagolf_app/app/modules/home/controllers/home_controller.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/modules/widgets/year_picker_widget.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'current_value_monitor_widget.dart';
import 'item_request_lembur.dart';
import 'loading_item_request_widget.dart';

class LemburViewWidget extends StatelessWidget {
  const LemburViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Lembur',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          InputDropDownWidget(
                            items: controller.years,
                            value: controller.yearLembur,
                            hint: 'Periode',
                            onChange: (value) {
                              controller.onChangeYearLembur(value);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CurrentValueMonitorWidget(
                                isLoading: controller.isLoadingCountLembur,
                                title:
                                    '${controller.lemburCountData?.data?.pending}',
                                desc: 'Pending',
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                              child: VerticalDivider(
                                thickness: 2,
                              ),
                            ),
                            Expanded(
                              child: CurrentValueMonitorWidget(
                                isLoading: controller.isLoadingCountLembur,
                                title:
                                    '${controller.lemburCountData?.data?.reject}',
                                desc: 'Reject',
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                              child: VerticalDivider(
                                thickness: 2,
                              ),
                            ),
                            Expanded(
                              child: CurrentValueMonitorWidget(
                                isLoading: controller.isLoadingCountLembur,
                                title:
                                    '${controller.lemburCountData?.data?.approve}',
                                desc: 'Approve',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'List Request Lembur',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            InputDropDownWidget(
                              items: controller.status,
                              hint: 'Status',
                              value: controller.statusLembur,
                              bgColor: primaryColor,
                              textColor: Colors.white,
                              onChange: (value) {
                                controller.onChangeStatusLembur(value);
                              },
                              selectedItemBuilder: (BuildContext ctxt) {
                                return controller.status.map<Widget>((item) {
                                  return DropdownMenuItem(
                                      value: item.value,
                                      child: Text(
                                        "${item.value}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ));
                                }).toList();
                              },
                            ),
                          ],
                        ),
                        !controller.isLoadingLembur &&
                                (controller.listLembur?.data?.length == 0 ||
                                    controller.listLembur?.data?.length == null)
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Lottie.asset(
                                        'assets/lottie/empty_state.json',
                                        repeat: false,
                                      ),
                                      const Text(
                                        'Tidak ada data lembur',
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
                                  controller:
                                      controller.lemburRefreshController,
                                  onRefresh: () {
                                    controller.getListLembur(true);
                                    controller.getCountLembur();
                                  },
                                  child: ListView.builder(
                                    physics: const ScrollPhysics(),
                                    itemCount: controller.isLoadingLembur
                                        ? 8
                                        : controller.listLembur?.data?.length ??
                                            0,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      if (controller.isLoadingLembur) {
                                        return const LoadingItemRequestWidget();
                                      }

                                      var data =
                                          controller.listLembur?.data![index];
                                      return ItemRequestLembur(
                                        data: data!,
                                      );
                                    },
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: ButtonWidget(
                pd: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                mg: EdgeInsets.zero,
                text: 'Request Baru',
                borderRadiusSize: 40.r,
                width: 120.w,
                onTap: () async {
                  var isUpdate = await Get.toNamed(
                    Routes.DETAIL_REQUEST,
                    arguments: {
                      "type": RequestType.lembur,
                      "isCreate": true,
                    },
                  );

                  if (isUpdate) {
                    controller.getListLembur();
                    // controller.getCountIjin();
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
