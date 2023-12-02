import 'package:asiagolf_app/app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(431, 860),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: "Application",
        navigatorKey: globalNavKey,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
