import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/commom_loader.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/modules/assignments/controllers/assignments_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class SelectSubView extends GetView<AssignmentsController> {
  const SelectSubView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
      preferredSize: Size.fromHeight(46.kh),
      child: CustomAppBar(title: 'Assignment', isBack: true)),
      body: Padding(
       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          children: [
            subjectDropDawn(),
            SizedBox(
              width: double.infinity,
              child: TabBar(
                controller: controller.tabController,
                indicatorWeight: 3,
                indicatorColor: context.kPrimary,
                labelColor: context.kPrimary,
                unselectedLabelColor: context.kLightTextColor,
                tabs: const [
                  Tab(text: 'Assigned'),
                  Tab(text: 'Submitted'),
                ],
                onTap: (index) {
                  controller.selctedTabIndex.value;
                },
              ),
            ),
            Expanded(
              child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
              buildBody(),
              buildBody(),
             ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.kPrimary,
        shape: const CircleBorder(),
        elevation: 0,
        onPressed: () {
          Get.toNamed(Routes.ADD_ASSIGNMENT);
        },
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
                        child: Text(
                          item?.subject ?? '',
                          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
                      )).toList(),
              value: controller.subjectsController.selectedSubject.value == ''
                  ? null
                  : controller.subjectsController.subjectItems.firstWhere(
                      (SubjectsListModelData? item) =>
                      item?.subject == controller.subjectsController.selectedSubject.value),
              onChanged: (SubjectsListModelData? value) {
                log('Selected Subject: ${value?.subject}');
                Future.delayed(Duration.zero, () {
                  controller.subjectsController.selectedSubject.value = value?.subject ?? '';
                });
              },
            ),
          ),
        ));
  }

  Widget buildBody() {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: SingleChildScrollView(
      physics:const  BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         controller.selctedTabIndex.value == 0 ?
         assignedWidget():
         const Text('build')
        ],
      ),
      ),
    ));
  }


 Widget assignedWidget(){
  return Obx(() => controller.isLoding.value?
  const Loader():
    Column(
    children: [
    ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    separatorBuilder: (context, index) => 8.kheightBox,
    itemCount: controller.assignmentsList.value.data?.length?? 0,
    itemBuilder:(context, index) {
      return WidgetConstants.assignedWidget(
      assignment: controller.assignmentsList.value.data?[index]?.title?? '', 
      dueDate: controller.assignmentsList.value.data?[index]?.dueDate?? '',
      onEdit: (){
      //final data = controller.assignmentsList.value.data?[index];
      // Get.offNamed(Routes.ADD_ASSIGNMENT, arguments: data);
      }
     );
    },
     )
    ],
  ));
 } 

 Widget submittedWidget(){
  return Column();
 }
}
