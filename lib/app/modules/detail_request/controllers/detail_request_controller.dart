import 'dart:io';

import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/core/extention/dater_helper.dart';
import 'package:asiagolf_app/app/data/model/ijin/create/request_create_ijin_mode.dart';
import 'package:asiagolf_app/app/data/model/ijin/create/response_create_ijin_model.dart';
import 'package:asiagolf_app/app/data/model/ijin/detail/response_detail_ijin_data_model.dart';
import 'package:asiagolf_app/app/data/model/ijin/detail/response_detail_ijin_model.dart';
import 'package:asiagolf_app/app/data/remote/ijin_data_source.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum RequestType { lembur, ijin }

enum IjinType { ijin, cuti }

class DetailRequestController extends BaseController {
  final _ijinDataSource = Get.find<IjinDataSource>();
  final requestKey = GlobalKey<FormState>();

  XFile? picture;
  bool isCaptured = false;
  bool isCreatePage = false;
  bool isLoading = false;
  bool isLoadingGetData = false;
  String type = 'cuti';
  String? imagePath;
  RequestType requestType = RequestType.lembur;
  DateTime? selectedDate;
  int? dataId;

  ResponseDetailIjinDataModel? detailData;

  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController dateStartTextEditingController =
      TextEditingController();
  TextEditingController dateEndTextEditingController = TextEditingController();
  TextEditingController descTextEditingController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    requestType = Get.arguments["type"];
    isCreatePage = Get.arguments["isCreate"];
    dataId = Get.arguments["id"];
    if (!isCreatePage) {
      onGetDataDetail();
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dipose() {
    super.dispose();
    descTextEditingController.dispose();
    titleTextEditingController.dispose();
    dateStartTextEditingController.dispose();
    dateEndTextEditingController.dispose();
  }

  void onSelectedRadio(String value) {
    type = value;
    update();
  }

  void onSelectedStartDate(DateTime value) {
    selectedDate = value;
    dateStartTextEditingController.text = value.toSimpleString(
            requestType == RequestType.lembur
                ? 'dd/MM/yyyy HH:mm'
                : 'dd/MM/yyyy') ??
        '';
    update();
  }

  void onSelectedEndDate(DateTime value) {
    selectedDate = value;
    dateEndTextEditingController.text = value.toSimpleString(
            requestType == RequestType.lembur
                ? 'dd/MM/yyyy HH:mm'
                : 'dd/MM/yyyy') ??
        '';
    update();
  }

  void onConfirm() async {
    FocusScope.of(Get.context!).unfocus();
    if (requestKey.currentState!.validate()) {
      isLoading = true;
      update();

      await callDataService<ResponseCreateIjinModel>(
        () => _ijinDataSource.createIjin(
          RequestCreateIjinMode(
            title: titleTextEditingController.text.trim(),
            type: requestType == RequestType.lembur ? 'lembur' : type,
            timeStart: dateStartTextEditingController.text.trim(),
            timeEnd: dateEndTextEditingController.text.trim(),
            description: descTextEditingController.text.trim(),
          ),
          imagePath != null ? File(imagePath!) : null,
        ),
        onSuccess: (res) {
          Get.back(result: true);
          Fluttertoast.showToast(
            msg: "Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: primaryColor,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        },
      );

      isLoading = false;
      update();
    }
  }

  void onGetDataDetail() async {
    isLoadingGetData = true;
    update();

    await callDataService<ResponseDetailIjinModel>(
      () => _ijinDataSource.getDetailIjin(dataId!),
      onSuccess: (res) {
        detailData = res.data;
        titleTextEditingController.text = detailData?.title ?? '-';
        dateStartTextEditingController.text = detailData?.timeStart
                .toDateFromSimpleString(requestType == RequestType.lembur
                    ? 'dd/MM/yyyy hh:mm'
                    : 'dd/MM/yyyy')
                ?.toSimpleString(requestType == RequestType.lembur
                    ? 'dd/MM/yyyy HH:mm'
                    : 'dd/MM/yyyy') ??
            '-';
        dateEndTextEditingController.text = detailData?.timeEnd
                .toDateFromSimpleString(requestType == RequestType.lembur
                    ? 'dd/MM/yyyy hh:mm'
                    : 'dd/MM/yyyy')
                ?.toSimpleString(requestType == RequestType.lembur
                    ? 'dd/MM/yyyy HH:mm'
                    : 'dd/MM/yyyy') ??
            '-';
        descTextEditingController.text = detailData?.description ?? '-';
        type = detailData?.type.toLowerCase() ?? '';
        update();
      },
    );

    isLoadingGetData = false;
    update();
  }

  void onImageSelected(String? filePath) {
    imagePath = filePath;
  }
}
