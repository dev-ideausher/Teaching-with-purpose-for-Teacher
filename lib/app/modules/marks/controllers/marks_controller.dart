
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';

class MarksController extends GetxController {

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


}
