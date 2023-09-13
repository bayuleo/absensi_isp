import 'package:asiagolf_app/app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      navigatorKey: globalNavKey,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
