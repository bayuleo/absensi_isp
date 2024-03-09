import 'package:asiagolf_app/app/core/base/base_view.dart';
import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../controllers/user_edit_salary_controller.dart';

class UserEditSalaryView extends BaseView<UserEditSalaryController> {
  const UserEditSalaryView({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.argumentEditGaji!.isEditMode
            ? 'Edit Tunjangan Karyawan'
            : 'Tambah Tunjangan Karyawan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWithLabelWidget(
              label: "Nama Tunjangan",
              // initialValue: controller.profileData?.name ?? '',
              keyboardType: TextInputType.text,
              controller: controller.labelController,
              enabled: !(controller.argumentEditGaji?.isEditMode ?? false),
            ),
            SizedBox(
              height: 16,
            ),
            TextFieldWithLabelWidget(
              label: "Nominal",
              // initialValue: controller.profileData?.name ?? '',
              keyboardType: TextInputType.number,
              controller: controller.valueController,
            ),
            SizedBox(
              height: 24,
            ),
            ButtonWidget(
              text: 'Simpan',
              onTap: () {
                controller.argumentEditGaji!.isEditMode
                    ? controller.argumentEditGaji?.isGajiPokok ?? false
                        ? controller.updateGajiPokok()
                        : controller.updateTunjangan()
                    : controller.addNewTunjangan();
              },
            ),
            if (controller.argumentEditGaji!.isShowDelete)
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    text: 'Hapus Data',
                    buttonColor: Colors.red,
                    onTap: () {
                      controller.removeTunjangan();
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
