import 'package:get/get.dart';

import '../controllers/my_classes_controller.dart';

class MyClassesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyClassesController>(
      () => MyClassesController(),
    );
  }
}
