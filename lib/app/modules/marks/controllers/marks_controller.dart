
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/class_model.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';

class MarksController extends GetxController {

final homeController = Get.find<HomeController>();


@override
  void onInit() {
  super.onInit();
 WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     initilize();
  });
  }


 void initilize() {
    homeController.updateSubjectItems();
    homeController.updateClassItems();
  }


  void selectSubject(SubjectsListModelData? value) {
    if (value != null) {
      homeController.selectedSubject.value = value.subject ?? '';
      homeController.selectedSubjectId.value = value.Id ?? '';
      log('Selected Subject ID:.... ${homeController.selectedSubjectId.value}');
    }
  }

  void selectClass(ClassModelData? value) {
    if (value != null) {
      homeController.selectedClass.value = "${value.className}-${value.section}";
      homeController.selectedClassId.value = value.Id ?? '';
      log('Selected Class ID:.... ${homeController.selectedClassId.value}');
    }
  }

}
