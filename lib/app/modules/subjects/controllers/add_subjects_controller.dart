import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSubjectsController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabController;
  var selectedTabIndex = 0.obs;

  var chapterNameController = TextEditingController();
  var topicNameController = TextEditingController();
  var topicDescriptionController = TextEditingController();
  var fileNameController = TextEditingController();
  var questionController = TextEditingController();
  var solutionController = TextEditingController();
  var options1 = TextEditingController();
  var options2 = TextEditingController();
  var options3 = TextEditingController();
  var options4 = TextEditingController();


  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController
        .addListener(() => selectedTabIndex.value = tabController.index);
    super.onInit();
  }


  @override
  void onClose() {
  chapterNameController.dispose();
  topicNameController.dispose();
  topicDescriptionController.dispose();
  fileNameController.dispose();
  tabController.dispose();
  questionController.dispose();
  solutionController.dispose();
  options1.dispose();
  options2.dispose();
  options3.dispose();
  options4.dispose();
  super.onClose();
  }
}