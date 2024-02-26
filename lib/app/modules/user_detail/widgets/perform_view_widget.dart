import 'package:asiagolf_app/app/data/model/users/list_user/response_list_users_data_model.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/modules/users_list/controllers/users_list_controller.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerformViewWidget extends StatelessWidget {
  final ResponseListUsersDataModel userData;

  const PerformViewWidget({
    required this.userData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersListController>(
      builder: (controller) {
        var selectedData =
            controller.dataUsers?.firstWhere((e) => e.id == userData.id);
        var value = [
          {'Jumlah Hari Kerja': '20 Hari'},
          {'Jumlah Ijin': '2 Hari'},
          {'Gaji Pokok': 'Rp 2.500.000,-'},
          {'Lembur': 'Rp 2.500.000,-'},
          {'Total Pendapatan Gaji': 'Rp 2.500.000,-'},
          {'Catatan': 'Gaji bulan ini dapat bonus Rp 100.000,-'},
        ];
        return SingleChildScrollView(
          child: Column(
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
                    child: ItemBiodataWidget(
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: ButtonWidget(
                  text: 'Update',
                  onTap: () async {},
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ItemBiodataWidget extends StatelessWidget {
  final String title;
  final String value;

  const ItemBiodataWidget({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: primaryColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: primaryTextColor,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
