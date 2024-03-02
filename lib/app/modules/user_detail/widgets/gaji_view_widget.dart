import 'package:asiagolf_app/app/data/model/users/list_user/response_list_users_data_model.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/modules/user_detail/controllers/user_detail_controller.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
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
        List<Map<String, String>> value = [];
        value.add({'Gaji Pokok': (selectedData?.gaji ?? 0).convertToCurrency});
        if (selectedData!.tunjangan.isNotEmpty) {
          for (var e in selectedData.tunjangan) {
            value.add({e.name.toCamelCase: e.amount.convertToCurrency});
          }
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.length,
                itemBuilder: (context, index) {
                  var item = value[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ItemGajiWidget(
                      title: item.keys.first,
                      value: item.values.first,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 12,
                  );
                },
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Divider(),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Total Gaji',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        Text(
                          'Rp 13.000.000',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Row(
                  children: [
                    Expanded(
                        child: ButtonWidget(
                      text: 'Update',
                      onTap: () async {},
                    )),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ItemGajiWidget extends StatelessWidget {
  final String title;
  final String value;

  const ItemGajiWidget({
    required this.title,
    required this.value,
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
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: primaryColor,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: primaryTextColor,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
