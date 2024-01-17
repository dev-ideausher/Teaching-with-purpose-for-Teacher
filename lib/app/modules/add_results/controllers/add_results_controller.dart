import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/students_model.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
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


//-----------------------Post results-------------------------------

Future<void> postResults() async {
    if (topicController.text.isEmpty || remarksController.text.isEmpty) {
      Utils.showMySnackbar(desc: 'Please fill the fields');
      return;
    }
     String? id = studentsData.value.Id;

    try {
      var body = {
        "subject": "english",
        "class": "8-A",
        "studentId": id,
        "resultType": selectedExamType.value,
        "markId": "603bb054d9a7c8bcdc48a825",
        "topic": topicController.text,
        "remarks": remarksController.text,
        "performance": selectedPerformance.value
      };

      log('..$body');

      final responce = await APIManager.addResult(body: body);

      if (responce.data['status'] == true) {
        log(responce.data);
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
