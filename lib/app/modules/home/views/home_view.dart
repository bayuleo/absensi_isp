import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: controller.selectedScreen == 0
              ? AppBar(
                  backgroundColor: primaryColor,
                  title: const Text('User Login Name'),
                  elevation: 0,
                )
              : null,
          body: controller.screen.elementAt(controller.selectedScreen),
          bottomNavigationBar: GetBuilder<HomeController>(
            builder: (controller) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: controller.onTapBottomMenu,
                currentIndex: controller.selectedScreen,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.work_history),
                    label: 'Lembur',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month),
                    label: 'Ijin',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
