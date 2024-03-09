import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/admin/request_add_tunjangan.dart';
import 'package:asiagolf_app/app/data/model/argument/argument_edit_gaji.dart';
import 'package:asiagolf_app/app/data/remote/admin_data_source.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

class UserEditSalaryController extends BaseController {
  final _adminDataSource = Get.find<AdminDataSource>();

  final labelController = TextEditingController();
  final valueController = MoneyMaskedTextController(
    leftSymbol: 'Rp ',
    decimalSeparator: '',
    initialValue: 0,
    precision: 0,
  );

  ArgumentEditGaji? argumentEditGaji;

  @override
  void onInit() {
    argumentEditGaji = Get.arguments;
    if (argumentEditGaji?.isEditMode ?? false) {
      labelController.text = argumentEditGaji?.selectedLabel ?? '';
      valueController.text = argumentEditGaji?.selectedValue ?? '';
    }
    update();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    labelController.dispose();
    valueController.dispose();
  }

  void addNewTunjangan() async {
    showLoading();
    update();

    await callDataService<bool>(
      () => _adminDataSource.postTunjangan(
        RequestAddTunjangan(
          name: labelController.text.trim(),
          amount: valueController.text.trim().currencyToPlainText,
          idUsers: argumentEditGaji!.userId,
        ),
      ),
      onSuccess: (res) async {
        Get.back(result: true);
      },
    );

    hideLoading();
    update();
  }

  void removeTunjangan() async {
    showLoading();
    update();

    await callDataService<bool>(
      () => _adminDataSource.deleteTunjangan(
        argumentEditGaji!.tunjanganId!,
      ),
      onSuccess: (res) async {
        Future.delayed(Duration(seconds: 1));
        Get.back(result: true);
      },
    );

    hideLoading();
    update();
  }

  void updateTunjangan() async {
    showLoading();
    update();

    await callDataService<bool>(
      () => _adminDataSource.updateTunjangan(
        argumentEditGaji!.tunjanganId!,
        valueController.text.trim().currencyToPlainText,
      ),
      onSuccess: (res) async {
        Future.delayed(Duration(seconds: 1));
        Get.back(result: true);
      },
    );

    hideLoading();
    update();
  }

  void updateGajiPokok() async {
    showLoading();
    update();

    await callDataService<bool>(
      () => _adminDataSource.updateUser(
        id: argumentEditGaji!.userId.toString(),
        gaji: valueController.text.currencyToPlainText,
      ),
      onSuccess: (res) {
        Get.back(result: true);
      },
    );

    hideLoading();
    update();
  }
}
