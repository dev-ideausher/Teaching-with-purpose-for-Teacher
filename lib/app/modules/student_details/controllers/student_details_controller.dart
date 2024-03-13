import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/assignmet_completion_model.dart';
import 'package:teaching_with_purpose/app/data/models/course_completion_model.dart';
import 'package:teaching_with_purpose/app/data/models/students_model.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class StudentDetailsController extends GetxController {
 RxBool isLoading = false.obs;
 Rx<StudentsModelData> studentsData = StudentsModelData().obs;
 Rx<CourseCompletionModel> courseCompletion = CourseCompletionModel().obs;
 Rx<AssignmentCompletionModel> assignmentTracking = AssignmentCompletionModel().obs;


 @override
  void onInit() {
    getArguments();
    super.onInit();
  }
 
   void getArguments()async{
    studentsData.value = Get.arguments;
    await courseCompletionTracking();
  }

  
   Future<void> courseCompletionTracking({String? selectedSub}) async {
    isLoading(true);
    String id = studentsData.value.Id!;
    try {
      final responce = await APIManager.getCourseCompletion(studentId: id,subject:selectedSub );
      if (responce.data['status'] == true) {
        courseCompletion.value = CourseCompletionModel.fromJson(responce.data);
        log('Course completion data...${responce.data}');
        await assignmentCompletionTracking();
      } else {
        Utils.showMySnackbar(desc: 'Something went wrong');
      }
    } catch (e) {
       log('e...**$e');
    } finally {
      isLoading(false);
    }
  }
  
  Future<void> assignmentCompletionTracking({String? selectedSub}) async {
    isLoading(true);
    String id = studentsData.value.Id!;
    try {
      final response = await APIManager.getAssignmentCompletion(studentId:id, subjectId: selectedSub);
      if (response.data['status'] == true) {
        assignmentTracking.value = AssignmentCompletionModel.fromJson(response.data);
        //log('Assignment completion data...${response.data}');
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
