import 'package:get/get.dart';

import '../controllers/users_create_controller.dart';

class UsersCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersCreateController>(
      () => UsersCreateController(),
    );
  }
}
