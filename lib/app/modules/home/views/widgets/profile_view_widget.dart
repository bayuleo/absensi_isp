import 'package:asiagolf_app/app/modules/home/controllers/home_controller.dart';
import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileViewWidget extends StatelessWidget {
  const ProfileViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SingleChildScrollView(
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
                  enabled: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWithLabelWidget(
                  label: "Email",
                  initialValue: controller.profileData?.email ?? '',
                  keyboardType: TextInputType.emailAddress,
                  enabled: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWithLabelWidget(
                  label: "NIK",
                  initialValue: controller.profileData?.nik ?? '',
                  keyboardType: TextInputType.number,
                  enabled: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWithLabelWidget(
                  label: "Jabatan",
                  initialValue: controller.profileData?.position ?? '',
                  keyboardType: TextInputType.text,
                  enabled: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWithLabelWidget(
                  label: "No Handphone",
                  initialValue: controller.profileData?.phone ?? '',
                  keyboardType: TextInputType.phone,
                  enabled: false,
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
                  enabled: false,
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
        );
      },
    );
  }
}
