import 'package:get/get.dart';

import '../controllers/add_questions_controller.dart';

class AddQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddQuestionsController>(
      () => AddQuestionsController(),
    );
  }
}
