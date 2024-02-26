import 'package:asiagolf_app/app/modules/home/views/widgets/item_log_absensi_widget.dart';
import 'package:asiagolf_app/app/modules/user_detail/controllers/user_detail_controller.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AbsentViewWidget extends StatelessWidget {
  const AbsentViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDetailController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: controller.absentDataModel?.absent.length != 0 &&
                  controller.absentDataModel?.absent.length != null
              ? ListView.separated(
                  itemCount: controller.absentDataModel?.absent.length ?? 0,
                  itemBuilder: (context, index) {
                    var item = controller.absentDataModel?.absent[index];
                    return ItemLogAbsensiWidget(
                      data: item,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 12,
                    );
                  },
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
        );
      },
    );
  }
}
