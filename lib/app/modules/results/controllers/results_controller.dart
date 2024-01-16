
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';

class ResultsController extends GetxController {
  final subjectsController = Get.find<SubjectsController>();

  @override
  void onInit() {
    initilize();
    super.onInit();
  }

  void initilize() {
    subjectsController.updateSubjectItems();
    subjectsController.updateClassItems();
  }
}
