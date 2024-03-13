import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/course_completion_model.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

class CourseCompletionController extends GetxController {
  final selectedSubjectIndex = 0.obs;
  String? studentId = '';
  RxBool isLoading = false.obs;
  Rx<CourseCompletionModel> courseCompletion = CourseCompletionModel().obs;
  List<SvgGenImage> subjectImage = [
    Assets.svg.allSubjects,
    Assets.svg.maths,
    Assets.svg.physicsRed,
    Assets.svg.chemistry,
    Assets.svg.history,
    Assets.svg.geography,
    Assets.svg.biology,
  ];


 @override
  void onInit() {
    setArguments();
    super.onInit();
  }

 void setArguments()async{
  final Map<String, dynamic> arguments = Get.arguments;
  studentId = arguments['studentId'];
  await courseCompletionTracking();
 }


  Future<void> courseCompletionTracking({String? selectedSub}) async {
    isLoading(true);
    String id = studentId!;
    try {
      final responce = await APIManager.getCourseCompletion(studentId: id, subject: selectedSub);
      if (responce.data['status'] == true) {
        courseCompletion.value = CourseCompletionModel.fromJson(responce.data);
        log('Course completion data...${responce.data}');
      } else {
        Utils.showMySnackbar(desc: 'Something went wrong');
      }
    } catch (e) {
      log('e...**$e');
    } finally {
      isLoading(false);
    }
  }
}
