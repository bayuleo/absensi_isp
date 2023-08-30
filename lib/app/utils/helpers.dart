import 'dart:developer';

import 'package:asiagolf_app/app/utils/global.dart';
import 'package:flutter/material.dart';

void dprint(dynamic value) => log("pantau:::: $value");

bool isEmpty(dynamic value) => ['null', '', '[]', '{}', '0'].contains("$value");

bool isNotEmpty(dynamic value) =>
    !['null', '', '[]', '{}', '0'].contains("$value");

Future<void> showSnack(String errorMsg, {String errCode = "0"}) async {
  ScaffoldMessenger.of(globalNavKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(errorMsg),
      dismissDirection: DismissDirection.horizontal,
      showCloseIcon: true,
      duration: const Duration(seconds: 3),
    ),
  );
  await Future.delayed(const Duration(seconds: 2));
}
