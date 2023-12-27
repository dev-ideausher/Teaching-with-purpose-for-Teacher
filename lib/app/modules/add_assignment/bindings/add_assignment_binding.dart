import 'package:get/get.dart';

import '../controllers/add_assignment_controller.dart';

class AddAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAssignmentController>(
      () => AddAssignmentController(),
    );
  }
}
