import 'package:asiagolf_app/app/core/base/base_view.dart';
import 'package:asiagolf_app/app/modules/user_detail/widgets/absent_view_widget.dart';
import 'package:asiagolf_app/app/modules/user_detail/widgets/biodata_view_widget.dart';
import 'package:asiagolf_app/app/modules/user_detail/widgets/gaji_view_widget.dart';
import 'package:asiagolf_app/app/modules/user_detail/widgets/ijin_view_widget.dart';
import 'package:asiagolf_app/app/modules/user_detail/widgets/lembur_view_widget.dart';
import 'package:asiagolf_app/app/modules/user_detail/widgets/perform_view_widget.dart';
import 'package:asiagolf_app/app/modules/users_list/controllers/users_list_controller.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_detail_controller.dart';

class UserDetailView extends BaseView<UserDetailController> {
  const UserDetailView({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    var tabTextTheme = TextStyle(
      fontSize: 16,
      color: primaryTextColor,
    );
    return GetBuilder<UsersListController>(
      builder: (userListController) {
        return GetBuilder<UserDetailController>(
          builder: (controller) {
            var selectedData = userListController.dataUsers
                ?.firstWhere((e) => e.id == controller.userData!.id);
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(32),
                    width: double.infinity,
                    color: primaryColor,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60.w,
                          backgroundImage: CachedNetworkImageProvider(
                            selectedData?.filename ?? '',
                            maxHeight: 300,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          selectedData?.name ?? '',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TabBar(
                    isScrollable: true,
                    controller: controller.tabController,
                    tabs: [
                      Tab(
                        child: Text(
                          'Biodata',
                          style: tabTextTheme,
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Gaji',
                          style: tabTextTheme,
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Absensi',
                          style: tabTextTheme,
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Lembur',
                          style: tabTextTheme,
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Ijin',
                          style: tabTextTheme,
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Perform',
                          style: tabTextTheme,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        BiodataViewWidget(
                          userData: controller.userData!,
                        ),
                        GajiViewWidget(userData: controller.userData!),
                        AbsentViewWidget(),
                        LemburViewWidget(),
                        IjinViewWidget(),
                        PerformViewWidget(
                          userData: controller.userData!,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
