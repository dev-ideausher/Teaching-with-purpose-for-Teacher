
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';

import '../../../data/models/class_model.dart';

class ResultsController extends GetxController {
  final subjectsController = Get.find<SubjectsController>();

  @override
  void onInit() {
    super.onInit();
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     initilize();
  });
  }

  void initilize() {
    subjectsController.updateSubjectItems();
    subjectsController.updateClassItems();
  }


   void selectSubject(SubjectsListModelData? value) {
    if (value != null) {
      subjectsController.selectedSubject.value = value.subject ?? '';
      subjectsController.selectedSubjectId.value = value.Id ?? '';
      log('Selected Subject ID:.... ${subjectsController.selectedSubjectId.value}');
    }
  }

  void selectClass(ClassModelData? value) {
    if (value != null) {
      subjectsController.selectedClass.value = "${value.className}-${value.section}";
      subjectsController.selectedClassId.value = value.Id ?? '';
      log('Selected Class ID:.... ${subjectsController.selectedClassId.value}');
    }
  }
}
