import 'package:asiagolf_app/app/core/base/base_view.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/loading_item_request_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../controllers/users_list_controller.dart';

class UsersListView extends BaseView<UsersListController> {
  const UsersListView({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pegawai'),
        centerTitle: true,
      ),
      body: GetBuilder<UsersListController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: SmartRefresher(
                    controller: controller.refreshController,
                    onRefresh: () {
                      controller.getAllUsers();
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const ScrollPhysics(),
                            itemCount: controller.isLoadingGetUsers
                                ? 10
                                : controller.dataUsers?.length ?? 0,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (controller.isLoadingGetUsers) {
                                return LoadingItemRequestWidget();
                              }
                              var data = controller.dataUsers?[index];
                              return InkWell(
                                onTap: () async {
                                  // var result = await Get.toNamed(
                                  //   Routes.USERS_CREATE,
                                  //   arguments: data!.id,
                                  // );
                                  var result = await Get.toNamed(
                                    Routes.USER_DETAIL,
                                    arguments: data!,
                                  );
                                  if (result) {
                                    controller.getAllUsers();
                                  }
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data?.name ?? 'Fullname',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Text(data?.phone ??
                                                '08123 4567 8787'),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Text(
                                              data?.position ?? 'Role',
                                              style: TextStyle(
                                                  color: secondaryTextColor),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: () {
                                                controller.onClickDelete(
                                                  id: data!.id,
                                                  name: data!.name,
                                                );
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: secondaryTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonWidget(
                    text: 'Tambah Pegawai',
                    onTap: () async {
                      var result = await Get.toNamed(Routes.USERS_CREATE);
                      if (result) {
                        controller.getAllUsers();
                      }
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
