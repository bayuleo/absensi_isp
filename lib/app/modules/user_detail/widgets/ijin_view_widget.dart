import 'package:asiagolf_app/app/modules/user_detail/controllers/user_detail_controller.dart';
import 'package:asiagolf_app/app/modules/user_detail/widgets/item_ijin_widget.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class IjinViewWidget extends StatelessWidget {
  const IjinViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDetailController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: controller.listIjin?.data?.ijin.length != 0
              ? ListView.separated(
                  itemCount: controller.listIjin?.data?.ijin.length ?? 0,
                  itemBuilder: (context, index) {
                    var item = controller.listIjin!.data!.ijin[index];
                    return ItemIjin(
                      dataIjin: item,
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
                      'Tidak ada data ijin',
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
