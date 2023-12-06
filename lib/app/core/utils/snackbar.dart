import 'dart:convert';

import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static error({
    Key? key,
    String? title,
    String? desc,
    Widget? titleWidget,
    Widget? descWidget,
    DioError? dioError,
    BuildContext? context,
  }) {
    var ctx = context ?? Get.context!;
    String? snackbarDesc;
    if (dioError != null) {
      try {
        dynamic errorData;
        try {
          errorData = jsonDecode(dioError.response!.data);
        } catch (_) {
          errorData = dioError.response!.data;
        }

        snackbarDesc = errorData != null
            ? (errorData['message'] != null
                ? errorData['message']
                : dioError.message)
            : dioError.message;
      } catch (e) {
        snackbarDesc = dioError.message;
      }
    }
    if (snackbarDesc == null || snackbarDesc.isEmpty) {
      snackbarDesc = desc ?? "Something wrong";
    }
    Get.snackbar(
      title ?? "Warning",
      snackbarDesc,
      icon: Icon(
        Icons.error,
        color: Colors.red,
        key: key,
      ),
      colorText: primaryTextColor,
      backgroundColor: backgroundColor,
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 5,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      titleText: titleWidget,
      messageText: descWidget,
      duration: Duration(seconds: 5),
    );
  }

  static warning({
    Key? key,
    required String title,
    required String desc,
    Widget? titleWidget,
    Widget? descWidget,
    BuildContext? context,
  }) {
    var ctx = context ?? Get.context!;
    Get.snackbar(
      title,
      desc,
      icon: Icon(
        Icons.warning,
        color: Colors.amber,
        key: key,
      ),
      colorText: primaryTextColor,
      backgroundColor: backgroundColor,
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 5,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      titleText: titleWidget,
      messageText: descWidget,
    );
  }

  static success({
    Key? key,
    required String title,
    required String desc,
    Widget? titleWidget,
    Widget? descWidget,
    BuildContext? context,
  }) {
    var ctx = context ?? Get.context!;
    Get.snackbar(
      title,
      desc,
      icon: Icon(
        Icons.check,
        color: Colors.green,
        key: key,
      ),
      colorText: primaryTextColor,
      backgroundColor: backgroundColor,
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 5,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      titleText: titleWidget,
      messageText: descWidget,
    );
  }

  static common({
    Key? key,
    required String title,
    required String desc,
    Widget? icon,
    Duration? duration,
    SnackPosition? snackPosition,
    Color? colorText,
    Color? backgroundColor,
    List<BoxShadow>? boxShadows,
    Widget? titleWidget,
    Widget? descWidget,
    BuildContext? context,
  }) {
    var ctx = Get.context!;
    Get.snackbar(
      title,
      desc,
      icon: icon ??
          Icon(
            Icons.check,
            color: Colors.green,
            key: key,
          ),
      colorText: colorText ?? primaryTextColor,
      backgroundColor: backgroundColor ?? backgroundColor,
      boxShadows: boxShadows ??
          [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      duration: duration,
      titleText: titleWidget,
      messageText: descWidget,
    );
  }
}
