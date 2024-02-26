import 'package:animated_digit/animated_digit.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  const HomeAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeAdminController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('HomeAdminView'),
            centerTitle: false,
          ),
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListTile(
                  onTap: () {
                    controller.onClickLogout();
                  },
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  dense: true,
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Status Absensi',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width / 2 - 26,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Kerja',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40,
                                  color: primaryColor,
                                ),
                              ),
                              AnimatedDigitWidget(
                                value:
                                    controller.dashboardData?.kerja.count ?? 0,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 80,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width / 2 - 26,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Ijin',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40,
                                  color: primaryColor,
                                ),
                              ),
                              AnimatedDigitWidget(
                                value:
                                    controller.dashboardData?.ijin.count ?? 0,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 80,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text(
                    'Request Pending',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width / 2 - 26,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Ijin',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '7',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 80,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width / 2 - 26,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Lembur',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '7',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 80,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text(
                    'Admin Menu',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.USERS_LIST);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.people,
                              size: 40,
                            ),
                            Text('Pegawai'),
                          ],
                        ),
                      ),
                      const Column(
                        children: [
                          Icon(
                            Icons.payments_outlined,
                            size: 40,
                          ),
                          Text('Gaji'),
                        ],
                      ),
                      const Column(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 40,
                          ),
                          Text('Profile'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text(
                    'Info New Task',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    itemCount: 8,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kabel FO Putus',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                              'Adanya laporan warga bahwa kabel fo ada yang putus di sekitar area pedalaman rumah asing'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Andi Reporter | 25 Okt 2023 13:33',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: secondaryTextColor),
                          ),
                          Divider(),
                        ],
                      );
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
