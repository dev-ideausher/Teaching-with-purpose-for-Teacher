import 'package:get/get.dart';

import '../controllers/add_marks_controller.dart';

class AddMarksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMarksController>(
      () => AddMarksController(),
    );
  }
}
