import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignmentsController extends GetxController  with GetSingleTickerProviderStateMixin{
  late TabController tabController;
  var selectedSubject = 'Mathematics'.obs;
  var selctedTabIndex = 0.obs;

//... list of  subject  for dropdawn
  final List<String> items = [
    'Mathematics',
    'English',
  ];


// ...... for tab ......
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController
        .addListener(() => selctedTabIndex.value = tabController.index);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

// ..........function for dropDawn
  void selectSubject(String item) {
    selectedSubject.value = item;
  }
}
