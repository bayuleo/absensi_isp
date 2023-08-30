import 'dart:developer';

import 'package:asiagolf_app/app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'theme.dart';

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

Future<Position> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;
  bool denyAcces;
  int requestCount = 0;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  denyAcces = [LocationPermission.denied, LocationPermission.deniedForever]
      .contains(permission);

  while (denyAcces) {
    requestCount++;
    permission = await Geolocator.requestPermission();
    denyAcces = [LocationPermission.denied, LocationPermission.deniedForever]
        .contains(permission);

    if (denyAcces && requestCount >= 3) {
      return Future.error('Location permissions are denied');
    }
  }

  return await Geolocator.getCurrentPosition();
}

Future<void> pickDate(Function(String?) callBack) async {
  DateTime? date = await showDatePicker(
      context: globalNavKey.currentContext!,
      initialDate: DateTime(1997),
      firstDate: DateTime(1980),
      lastDate: DateTime(2018),
      builder: (_, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            colorScheme: const ColorScheme.light(
              primary: primaryColor,
            ).copyWith(
              secondary: secondaryColor,
            ),
          ),
          child: child!,
        );
      });

  FocusScope.of(globalNavKey.currentContext!).unfocus();
  if (date != null) callBack(DateFormat("yyyy-MM-dd").format(date));
}
