
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/services/global_services.dart';
import 'package:teaching_with_purpose/app/services/storage.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

import '../../../data/models/students_model.dart';

class AddMarksController extends GetxController {

var selectedPeriod = 'Yearly'.obs;
var selectedResult = 'Pass'.obs;

RxString markId = ''.obs;
var marksController = TextEditingController();
var gradesController = TextEditingController();
Rx<StudentsModelData> studentModel = StudentsModelData().obs;

@override
  void onInit() {
    seArguments();
    super.onInit();
  }

 void seArguments(){
    studentModel.value = Get.arguments;
 }

     String? selectedSubject = Get.find<SubjectsController>().selectedSubjectId.value;
     String? selectedClass = Get.find<SubjectsController>().selectedClassId.value;


//-----------------------Add Marks-------------------------------

Future<void> addMarkstoStudent() async {
    if (marksController.text.isEmpty || gradesController.text.isEmpty) {
      Utils.showMySnackbar(desc: 'Please fill the fields');
      return;
    }

      var body = {
        "subject": selectedSubject,
        "class": selectedClass,
        "studentId": studentModel.value.Id,
        "examType": selectedPeriod.value.toLowerCase(),
        "marks": int.parse(marksController.text),
        "grade": gradesController.text,
        "passOrFail": selectedResult.value.toLowerCase()
      };

    try {

      log('body..$body');

      final responce = await APIManager.addMarks(body: body);

      if (responce.data['status'] == true) {
      
      log('${responce.data}');
        String markId = responce.data['data']['_id'] ?? '';

        Get.find<GetStorageService>().markId = markId;  

        //log('id..${Get.find<GetStorageService>().markId}');   

       Get.toNamed(Routes.BOTTOM_NAV);

      Utils.showMySnackbar(desc: 'Marks Added Successfully');

      } else {
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
      log('*...$e');

    }
  }

  @override
  void onClose() {
  marksController.dispose();
  gradesController.dispose();
  super.onClose();
  }
}
