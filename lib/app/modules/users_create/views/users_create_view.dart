import 'package:asiagolf_app/app/core/base/base_view.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/modules/widgets/input_photo_widget.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/views/widget/text_field_with_label_widget.dart';
import '../controllers/users_create_controller.dart';

class UsersCreateView extends BaseView<UsersCreateController> {
  const UsersCreateView({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return GetBuilder<UsersCreateController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
                controller.userId != null ? 'Edit Pegawai' : 'Tambah Pegawai'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "Nama",
                    // initialValue: controller.profileData?.name ?? '',
                    keyboardType: TextInputType.name,
                    controller: controller.nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "Password",
                    // initialValue: controller.profileData?.name ?? '',
                    keyboardType: TextInputType.name,
                    controller: controller.passController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "NIK",
                    // initialValue: controller.profileData?.name ?? '',
                    keyboardType: TextInputType.number,
                    controller: controller.nikController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "Email",
                    // initialValue: controller.profileData?.name ?? '',
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "Alamat",
                    // initialValue: controller.profileData?.name ?? '',
                    keyboardType: TextInputType.name,
                    controller: controller.addressController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWithLabelWidget(
                    label: "No Handphone",
                    // initialValue: controller.profileData?.name ?? '',
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Jabatan',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Radio(
                              value: 'admin',
                              groupValue: controller.role,
                              onChanged: (value) {
                                controller.onSelectedRadio(value!);
                              },
                            ),
                            Text('Admin'),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Radio(
                              value: 'user',
                              groupValue: controller.role,
                              onChanged: (value) {
                                controller.onSelectedRadio(value!);
                              },
                            ),
                            Text('User'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //TODO JIKA BUTUH INPUT JAM KERJA
                  // const Text(
                  //   'Jam Kerja',
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.w600,
                  //     color: primaryColor,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // DropdownButtonFormField2(
                  //   items: controller.workingTime,
                  //   isExpanded: true,
                  //   decoration: InputDecoration(
                  //     contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(14),
                  //     ),
                  //   ),
                  //   hint: const Text(
                  //     'Pilih Jam Kerja',
                  //     style: TextStyle(fontSize: 14),
                  //   ),
                  //   validator: (value) {
                  //     if (value == null) {
                  //       return 'Pilih Jam Kerja';
                  //     }
                  //     return null;
                  //   },
                  //   onChanged: (value) {
                  //     controller.onSelectedWorkingTime(value);
                  //   },
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputPhotoWidget(
                    onSelectedImage: (photoPath) {
                      controller.onImageSelected(photoPath);
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonWidget(
                    text: controller.userId != null ? 'Update' : 'Simpan',
                    isLoading: controller.isLoading,
                    onTap: () {
                      if (controller.userId != null) {
                        controller.onClickSubmitPatch();
                      } else {
                        controller.onClickSubmitAdd();
                      }
                    },
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
