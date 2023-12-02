import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:flutter/material.dart';

class ProfileViewWidget extends StatelessWidget {
  const ProfileViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            const TextFieldWithLabelWidget(
              label: "Nama",
              hint: "Nama",
              // controller: controller.emailC,
              keyboardType: TextInputType.name,
              // validator: emailRequired,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFieldWithLabelWidget(
              label: "Email",
              hint: "Email",
              // controller: controller.emailC,
              keyboardType: TextInputType.emailAddress,
              // validator: emailRequired,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFieldWithLabelWidget(
              label: "NIK",
              hint: "NIK",
              // controller: controller.emailC,
              keyboardType: TextInputType.number,
              // validator: emailRequired,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFieldWithLabelWidget(
              label: "Jabatan",
              hint: "Jabatan",
              // controller: controller.emailC,
              keyboardType: TextInputType.text,
              // validator: emailRequired,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFieldWithLabelWidget(
              label: "No Handphone",
              hint: "No Handphone",
              // controller: controller.emailC,
              keyboardType: TextInputType.phone,
              // validator: emailRequired,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFieldWithLabelWidget(
              label: "Alamat",
              hint: "Alamat",
              // controller: controller.emailC,
              keyboardType: TextInputType.text,
              // validator: emailRequired,
              minLines: 3,
              maxLines: 5,
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonWidget(
              text: 'Logout',
              onTap: () {},
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
