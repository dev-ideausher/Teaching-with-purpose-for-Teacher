import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/add_subjects_controller.dart';

import '../controllers/subjects_controller.dart';

class SubjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectsController>(
      () => SubjectsController(),
    );
    Get.lazyPut<AddSubjectsController>(
      () => AddSubjectsController(),
    );
  }
}
