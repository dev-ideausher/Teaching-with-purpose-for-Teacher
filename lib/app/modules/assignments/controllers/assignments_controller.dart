import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';

class AssignmentsController extends GetxController  with GetSingleTickerProviderStateMixin{
 late TabController tabController;
  var selctedTabIndex = 0.obs;

  final subjectsController = Get.find<SubjectsController>();


  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     initilize();
  });
  }

 void initilize(){
    subjectsController.updateSubjectItems();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => selctedTabIndex.value = tabController.index);
 }


  @override
  void onClose() {
   tabController.dispose();
    super.onClose();
  }
}
