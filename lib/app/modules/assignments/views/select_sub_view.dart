import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/modules/assignments/controllers/assignments_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class SelectSubView extends GetView<AssignmentsController>{
  const SelectSubView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
  return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Assignment', isBack: true)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              subjectDropDawn(),
              32.kheightBox,
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {Get.toNamed(Routes.ADD_ASSIGNMENT);},
        backgroundColor: context.kPrimary,
        child: Icon(Icons.add, color: context.kWhite),
      ),
    );
  }


// subject dropDawn
  Widget subjectDropDawn() {
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<SubjectsListModelData?>(
              isExpanded: true,
              hint: Text('Select Subject',
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              items: controller.subjectsController.subjectItems
                  .map((SubjectsListModelData? item) =>
                      DropdownMenuItem<SubjectsListModelData?>(
                        value: item,
                        child: Text(item?.subject ?? '',
                            style: TextStyleUtil.kText16_5(
                                fontWeight: FontWeight.w400)),
                      ))
                  .toList(),
              value: controller.subjectsController.selectedSubject.value == ''
                  ? null
                  : controller.subjectsController.subjectItems.firstWhere(
                      (SubjectsListModelData? item) =>
                          item?.subject ==
                          controller.subjectsController.selectedSubject.value),
              onChanged: (SubjectsListModelData? value) {
                log('Selected Subject: ${value?.subject}');
                Future.delayed(Duration.zero, () {
                  controller.subjectsController.selectedSubject.value =
                      value?.subject ?? '';
                });
              },
            ),
          ),
        ));
  }
  }
