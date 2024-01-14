import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/core/widgets/dialog/confirmation_dialog_widget.dart';
import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/data/remote/admin_data_source.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UsersListController extends BaseController {
  final _adminDataSource = Get.find<AdminDataSource>();

  List<ResponseListUsersDataModel>? dataUsers = [];

  bool isLoadingDelete = false;
  bool isLoadingGetUsers = false;

  RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    getAllUsers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dipose() {
    refreshController.dispose();
    super.dispose();
  }

  Future<void> getAllUsers() async {
    isLoadingGetUsers = true;
    update();

    await callDataService<ResponseListUsersModel>(
      () => _adminDataSource.getAllUser(),
      loading: false,
      onSuccess: (res) {
        dataUsers = res.data;
      },
    );

    refreshController.refreshCompleted();
    isLoadingGetUsers = false;
    update();
  }

  Future<void> deleteUser(int id) async {
    showLoading();
    update();
    await callDataService<bool>(
      () => _adminDataSource.removeUser(id),
      onSuccess: (res) async {
        await getAllUsers();
        Fluttertoast.showToast(
          msg: "User berhasil terhapus",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: primaryColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
    );
    hideLoading();
    update();
  }

  void onClickDelete({
    required int id,
    required String name,
  }) async {
    Get.dialog(
      ConfirmDialogWidget(
        title: 'Delete User',
        content: 'Apakah anda yakin ingin menghapus user $name ?',
        onConfirm: () async {
          Get.back();
          await deleteUser(id);
        },
        onCancel: () {
          Get.back();
        },
      ),
    );
  }
}
