
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/assignments_list_model.dart';
import 'package:teaching_with_purpose/app/data/models/class_model.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class AssignmentsController extends GetxController with GetSingleTickerProviderStateMixin  {
 late TabController tabController;
  var selctedTabIndex = 0.obs;
  RxBool isLoding = false.obs;
  Rx<AssignmentsListModel> assignmentsList = AssignmentsListModel().obs;

  final homeController = Get.find<HomeController>();


  @override
  void onInit() {
  super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     initilize();
  });
  }

 void initilize()async{
    homeController.updateSubjectItems();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => selctedTabIndex.value = tabController.index);
    await assignedAssignments();
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


  //-----------------------assigned Assignment-------------------------------

  Future<void> assignedAssignments() async {
    isLoding(true);
    try {
      final responce = await APIManager.getAssignments();

      if (responce.data['status'] == true) {
        assignmentsList.value = AssignmentsListModel.fromJson(responce.data);
      } else {
        Utils.showMySnackbar(desc: 'somthing went wrong');
      }
    } catch (e) {
      log('error..$e');
    } finally {
      isLoding(false);
    }
  }
}
