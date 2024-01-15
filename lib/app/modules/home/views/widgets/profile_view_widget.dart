import 'package:asiagolf_app/app/modules/home/controllers/home_controller.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: CachedNetworkImageProvider(
                          controller.profileData?.filename ?? '',
                          maxHeight: 20,
                          maxWidth: 20,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.profileData?.name ?? '',
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              controller.profileData?.position ?? '',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    title: Text('Absensi'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: secondaryTextColor,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.REPORT_ABSENSI);
                    },
                  ),
                  ListTile(
                    title: Text('Lembur'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: secondaryTextColor,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.REPORT_LEMBUR);
                    },
                  ),
                  ListTile(
                    title: Text('Payroll'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: secondaryTextColor,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.REPORT_PAYROLL);
                    },
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    title: Text('My Account'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: secondaryTextColor,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                  ),
                  ListTile(
                    title: Text('Logout'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: secondaryTextColor,
                    ),
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
