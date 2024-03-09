import 'package:asiagolf_app/app/data/model/argument/argument_edit_gaji.dart';
import 'package:asiagolf_app/app/data/model/users/list_user/response_list_users_data_model.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/modules/user_detail/controllers/user_detail_controller.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GajiViewWidget extends StatelessWidget {
  final ResponseListUsersDataModel userData;

  const GajiViewWidget({
    required this.userData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDetailController>(
      builder: (controller) {
        var selectedData = controller.userDetail?.data;
        var gaji = int.tryParse(selectedData?.gaji ?? '0') ?? 0;
        var gajiTotal = 0;
        List<Map<String, String>> tunjangan = [];
        if (selectedData!.tunjangan.isNotEmpty) {
          for (var e in selectedData.tunjangan) {
            tunjangan.add({e.name.toCamelCase: e.amount.convertIntToCurrency});
            gajiTotal += e.amount;
          }
        }
        gajiTotal += gaji;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Pokok',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: ItemGajiWidget(
                    title: 'Gaji Pokok',
                    value: gaji.convertIntToCurrency,
                    onTapEdit: () async {
                      var result = await Get.toNamed(
                        Routes.USER_EDIT_SALARY,
                        arguments: ArgumentEditGaji(
                          userId: selectedData.id,
                          isEditMode: true,
                          isShowDelete: false,
                          isGajiPokok: true,
                          selectedLabel: "Gaji Pokok",
                          selectedValue: selectedData.gaji,
                        ),
                      );
                      if (result) {
                        controller.getUserById(controller.userData!.id);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Tunjangan',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: tunjangan.length,
                  itemBuilder: (context, index) {
                    var item = tunjangan[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: ItemGajiWidget(
                        title: item.keys.first,
                        value: item.values.first,
                        onTapEdit: () async {
                          var result = await Get.toNamed(
                            Routes.USER_EDIT_SALARY,
                            arguments: ArgumentEditGaji(
                              userId: selectedData.id,
                              tunjanganId: selectedData.tunjangan[index].id,
                              isEditMode: true,
                              isShowDelete: true,
                              isGajiPokok: false,
                              selectedLabel: item.keys.first,
                              selectedValue: item.values.first,
                            ),
                          );
                          if (result) {
                            controller.getUserById(controller.userData!.id);
                          }
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    const Divider(),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        Text(
                          gajiTotal.convertIntToCurrency,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Row(
                    children: [
                      Expanded(
                          child: ButtonWidget(
                        text: 'Add Tunjangan',
                        onTap: () async {
                          var result = await Get.toNamed(
                            Routes.USER_EDIT_SALARY,
                            arguments: ArgumentEditGaji(
                              userId: selectedData.id,
                              isEditMode: false,
                              isShowDelete: false,
                              isGajiPokok: false,
                            ),
                          );
                          if (result) {
                            controller.getUserById(controller.userData!.id);
                          }
                        },
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class ItemGajiWidget extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTapEdit;

  const ItemGajiWidget({
    required this.title,
    required this.value,
    required this.onTapEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: primaryColor,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: primaryTextColor,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            InkWell(
              onTap: onTapEdit,
              child: Icon(
                Icons.edit,
                size: 14.w,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
