import 'dart:io';

import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/data/remote/admin_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersCreateController extends BaseController {
  final _adminDataSource = Get.find<AdminDataSource>();

  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController workHourController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isLoading = false;
  String? imagePath;

  String role = '';
  String workingMode = '';
  List<DropdownMenuItem> workingTime = [
    DropdownMenuItem<String>(
      value: 'reguler',
      child: Text('Reguler'),
    ),
    DropdownMenuItem<String>(
      value: 'shift',
      child: Text('Shift'),
    ),
  ];

  int? userId;
  ResponseUsersModel? dataUser;

  @override
  void onInit() {
    super.onInit();
    userId = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
    if (userId != null) {
      getUserById(userId!);
    }
  }

  @override
  void dipose() {
    super.dispose();
    nameController.dispose();
    nikController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    roleController.dispose();
    workHourController.dispose();
    passController.dispose();
  }

  void onImageSelected(String? filePath) {
    print('bayu $filePath');
    imagePath = filePath;
  }

  Future<void> getUserById(int id) async {
    showLoading();
    update();

    await callDataService<ResponseUsersModel>(
      () => _adminDataSource.getUserById(id),
      onSuccess: (res) {
        dataUser = res;
        nameController.text = dataUser?.data?.name ?? '';
        passController.text = dataUser?.data?.password ?? '';
        nikController.text = dataUser?.data?.nik ?? '';
        emailController.text = dataUser?.data?.email ?? '';
        addressController.text = dataUser?.data?.address ?? '';
        phoneController.text = dataUser?.data?.phone ?? '';
        role = dataUser?.data?.position.toLowerCase() ?? '';
        update();
      },
    );

    hideLoading();
    update();
  }

  void onClickSubmitAdd() async {
    isLoading = true;
    update();

    await callDataService<ResponseCreateUserModel>(
        () => _adminDataSource.addUser(
              name: nameController.text.trim(),
              nik: nikController.text.trim(),
              email: emailController.text.trim(),
              address: addressController.text.trim(),
              phone: phoneController.text.trim(),
              role: role,
              workingHour: workingMode,
              password: passController.text.trim(),
              image: imagePath != null ? File(imagePath!) : null,
            ), onSuccess: (res) {
      Get.back(result: true);
    });

    isLoading = false;
    update();
  }

  void onClickSubmitPatch() async {
    isLoading = true;
    update();

    await callDataService<bool>(
        () => _adminDataSource.updateUser(
              id: userId.toString(),
              name: nameController.text.trim(),
              nik: nikController.text.trim(),
              email: emailController.text.trim(),
              address: addressController.text.trim(),
              phone: phoneController.text.trim(),
              role: role,
              workingHour: workingMode,
              password: passController.text.trim(),
              image: imagePath != null ? File(imagePath!) : null,
            ), onSuccess: (res) {
      Get.back(result: true);
    });

    isLoading = false;
    update();
  }

  void onSelectedRadio(String value) {
    role = value;
    update();
  }

  void onSelectedWorkingTime(String value) {
    workingMode = value;
    update();
  }
}
