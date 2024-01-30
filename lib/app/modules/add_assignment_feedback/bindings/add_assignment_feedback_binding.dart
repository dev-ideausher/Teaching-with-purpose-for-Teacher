import 'package:get/get.dart';

import '../controllers/add_assignment_feedback_controller.dart';

class AddAssignmentFeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAssignmentFeedbackController>(
      () => AddAssignmentFeedbackController(),
    );
  }
}
