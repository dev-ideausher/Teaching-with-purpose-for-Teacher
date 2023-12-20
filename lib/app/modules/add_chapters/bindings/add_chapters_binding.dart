import 'package:get/get.dart';

import '../controllers/add_chapters_controller.dart';

class AddChaptersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddChaptersController>(
      () => AddChaptersController(),
    );
  }
}
