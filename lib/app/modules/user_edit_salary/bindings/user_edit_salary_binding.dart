import 'package:get/get.dart';

import '../controllers/user_edit_salary_controller.dart';

class UserEditSalaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserEditSalaryController>(
      () => UserEditSalaryController(),
    );
  }
}
