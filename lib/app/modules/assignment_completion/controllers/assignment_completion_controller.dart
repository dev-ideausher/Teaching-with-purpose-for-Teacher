import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/assignmet_completion_model.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

class AssignmentCompletionController extends GetxController {
  final selectedSubjectIndex = 0.obs;
  String? studentId = '';
  RxBool isLoading = false.obs;
  Rx<AssignmentCompletionModel> assignmentTracking = AssignmentCompletionModel().obs;
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
  await assignmentCompletionTracking();
 }

  Future<void> assignmentCompletionTracking({String? selectedSub}) async {
    isLoading(true);
    String id = studentId!;
    try {
      final response = await APIManager.getAssignmentCompletion(studentId:id,subjectId: selectedSub);
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
