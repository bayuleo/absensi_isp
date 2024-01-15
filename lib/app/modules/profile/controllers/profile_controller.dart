import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/users/response_users_data_model.dart';
import 'package:asiagolf_app/app/data/model/users/response_users_model.dart';
import 'package:asiagolf_app/app/data/remote/users_data_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ProfileController extends BaseController {
  final _usersDataSource = Get.find<UsersDataSource>();

  RefreshController profileRefreshController =
      RefreshController(initialRefresh: false);

  ResponseUsersDataModel? profileData;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    profileRefreshController.dispose();
    nameController.dispose();
    emailController.dispose();
    nikController.dispose();
    roleController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void getProfile([bool isRefresh = false]) {
    callDataService<ResponseUsersModel>(
      () => _usersDataSource.getProfile(),
      loading: !isRefresh,
      onSuccess: (res) {
        profileData = res.data;
        nameController.text = profileData?.name ?? '';
        emailController.text = profileData?.email ?? '';
        nikController.text = profileData?.nik ?? '';
        roleController.text = profileData?.position ?? '';
        phoneController.text = profileData?.phone ?? '';
        addressController.text = profileData?.address ?? '';
        update();
      },
    );

    profileRefreshController.refreshCompleted();
    update();
  }
}
