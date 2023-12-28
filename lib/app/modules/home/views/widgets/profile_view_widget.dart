import 'package:asiagolf_app/app/modules/home/controllers/home_controller.dart';
import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ProfileViewWidget extends StatelessWidget {
  const ProfileViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SmartRefresher(
          controller: controller.profileRefreshController,
          onRefresh: () {
            controller.getProfile();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        'https://fastly.picsum.photos/id/64/400/400.jpg?hmac=ErFmAl4erEx5YCaq80Ik_J0J5YXwmgvoDkCmyekuL_I'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "Nama",
                    initialValue: controller.profileData?.name ?? '',
                    keyboardType: TextInputType.name,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "Email",
                    initialValue: controller.profileData?.email ?? '',
                    keyboardType: TextInputType.emailAddress,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "NIK",
                    initialValue: controller.profileData?.nik ?? '',
                    keyboardType: TextInputType.number,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "Jabatan",
                    initialValue: controller.profileData?.position ?? '',
                    keyboardType: TextInputType.text,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "No Handphone",
                    initialValue: controller.profileData?.phone ?? '',
                    keyboardType: TextInputType.phone,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "Alamat",
                    initialValue: controller.profileData?.address ?? '',
                    keyboardType: TextInputType.text,
                    minLines: 3,
                    maxLines: 5,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonWidget(
                    text: 'Logout',
                    onTap: () {
                      controller.onClickLogout();
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
