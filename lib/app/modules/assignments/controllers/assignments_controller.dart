
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/assignments_list_model.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class AssignmentsController extends GetxController with GetSingleTickerProviderStateMixin  {
 late TabController tabController;
  var selctedTabIndex = 0.obs;
  RxBool isLoding = false.obs;
  Rx<AssignmentsListModel> assignmentsList = AssignmentsListModel().obs;

  final subjectsController = Get.find<SubjectsController>();


  @override
  void onInit() {
  super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     initilize();
  });
  }

 void initilize()async{
    subjectsController.updateSubjectItems();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => selctedTabIndex.value = tabController.index);
    await assignedAssignments();
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
