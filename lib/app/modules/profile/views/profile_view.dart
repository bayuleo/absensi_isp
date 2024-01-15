import 'package:asiagolf_app/app/core/base/base_view.dart';
import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends BaseView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          body: SmartRefresher(
            controller: controller.profileRefreshController,
            onRefresh: () {
              controller.getProfile(true);
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: CachedNetworkImageProvider(
                        controller.profileData?.filename ?? '',
                        maxHeight: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWithLabelWidget(
                      label: "Nama",
                      controller: controller.nameController,
                      keyboardType: TextInputType.name,
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWithLabelWidget(
                      label: "Email",
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWithLabelWidget(
                      label: "NIK",
                      controller: controller.nikController,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWithLabelWidget(
                      label: "Jabatan",
                      controller: controller.roleController,
                      keyboardType: TextInputType.text,
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWithLabelWidget(
                      label: "No Handphone",
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWithLabelWidget(
                      label: "Alamat",
                      controller: controller.addressController,
                      keyboardType: TextInputType.text,
                      minLines: 3,
                      maxLines: 5,
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
