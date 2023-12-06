import 'package:asiagolf_app/app/modules/home/controllers/home_controller.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/item_request_ijin.dart';
import 'package:asiagolf_app/app/modules/widgets/year_picker_widget.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'current_value_monitor_widget.dart';

class IjinViewWidget extends StatelessWidget {
  const IjinViewWidget({
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
                        'Ijin',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      InputDropDownWidget(
                        items: controller.years,
                        value: controller.yearIjin,
                        hint: 'Periode',
                        onChange: (value) {
                          controller.onChangeYearIjin(value);
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
                            title: '${controller.ijinCountData?.pending}',
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
                            title: '${controller.ijinCountData?.reject}',
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
                            title: '${controller.ijinCountData?.approve}',
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
                          'List Request Ijin',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InputDropDownWidget(
                          items: controller.status,
                          hint: 'Status',
                          value: controller.statusIjin,
                          bgColor: primaryColor,
                          textColor: Colors.white,
                          onChange: (value) {
                            controller.onChangeStatusIjin(value);
                          },
                          selectedItemBuilder: (BuildContext ctxt) {
                            return controller.status.map<Widget>((item) {
                              return DropdownMenuItem(
                                  value: item.value,
                                  child: Text(
                                    "${item.value}",
                                    style: const TextStyle(color: Colors.white),
                                  ));
                            }).toList();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const ItemRequestIjin();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
