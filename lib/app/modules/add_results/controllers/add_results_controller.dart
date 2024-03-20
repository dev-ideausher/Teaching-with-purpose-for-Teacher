import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/students_model.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/services/storage.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class AddResultsController extends GetxController {
 var selectedExamType = 'Yearly'.obs;
 var selectedPerformance = 'Poor'.obs;
 var topicController = TextEditingController();
 var remarksController = TextEditingController();
 Rx<StudentsModelData> studentsData = StudentsModelData().obs;



 @override
  void onInit() {
    getArguments();
    super.onInit();
  }


  void getArguments(){
    studentsData.value = Get.arguments;
  }


     String? selectedSubject = Get.find<HomeController>().selectedSubjectId.value;
     String? selectedClass = Get.find<HomeController>().selectedClassId.value;
     String markId = Get.find<GetStorageService>().markId;


//-----------------------Post results-------------------------------

Future<void> postResults() async {
    if (topicController.text.isEmpty || remarksController.text.isEmpty) {
      Utils.showMySnackbar(desc: 'Please fill the fields');
      return;
    }
    var body = {
      "subject": selectedSubject,
      "class": selectedClass,
      "studentId": studentsData.value.Id,
      "resultType": selectedExamType.value,
      "markId": markId,
      "topic": topicController.text,
      "remarks": remarksController.text,
      "performance": selectedPerformance.value
    };

    try {

      log('..$body');

      final responce = await APIManager.addResult(body: body);

      if (responce.data['status'] == true) {
        log('results..${responce.data}');

        Get.toNamed(Routes.BOTTOM_NAV);

        Utils.showMySnackbar(desc: 'Results added Sucessfully');
      } else {
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
      log('error..*$e');
    }
  }



@override
  void onClose() {
    topicController.dispose();
    remarksController.dispose();
    super.onClose();
  }
}
