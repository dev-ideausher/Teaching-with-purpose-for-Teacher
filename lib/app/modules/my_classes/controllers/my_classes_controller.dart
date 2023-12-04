import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyClassesController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selctedTabIndex = 0.obs;



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
}
