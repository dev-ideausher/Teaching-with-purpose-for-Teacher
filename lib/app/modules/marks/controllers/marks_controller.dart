
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';

class MarksController extends GetxController {

final subjectsController = Get.find<SubjectsController>();

RxString examTypeString = ''.obs;
RxString passOrFailTextString = ''.obs;



 List<String> examType = ['Yearly','Half-Yearly','Live Quiz'];

 List<String> passOrFailText = ['Pass','Fail'];

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
