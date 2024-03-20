import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/modules/add_marks/controllers/add_marks_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AddMarksController>(
      () => AddMarksController(),
    );
  }

}
