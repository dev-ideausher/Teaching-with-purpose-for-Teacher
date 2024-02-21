import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/commom_loader.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/modules/assignments/controllers/assignments_controller.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

import '../../../../gen/assets.gen.dart';

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
                indicatorColor: context.kPrimary,
                labelColor: context.kPrimary,
                unselectedLabelColor: context.kLightTextColor,
                tabs: [
                  SizedBox(
                    width: 171.kw,
                    child: const Tab(text: 'Assigned')),
                  SizedBox(
                    width: 171.kw,
                    child: const Tab(text: 'Submitted')),
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
               controller.subjectsController.selectedSubject.value = value?.subject ?? '';
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
         submittedWidget()
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
      final data = controller.assignmentsList.value.data?[index];
      Get.offNamed(Routes.EDIT_ASSIGNMENT, arguments: data);
      }
     );
    },
     )
    ],
  ));
 } 

  Widget submittedWidget() {
    return Column(
      children: [
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => 8.kheightBox, 
        itemCount:Get.find<HomeController>().studentsmodel.value.data?.length?? 0,
        itemBuilder: (context, index) {
          return WidgetConstants.studentAssignmentCard(
            image: Get.find<HomeController>().studentsmodel.value.data?[index]?.image == null?
                  Assets.images.studImg1.image(height: 40.kh,width: 40.kw,fit: BoxFit.cover):
                  CachedNetworkImage(imageUrl:Get.find<HomeController>().studentsmodel.value.data?[index]?.image?? ''),
            name: Get.find<HomeController>().studentsmodel.value.data?[index]?.name?? '', 
            rollNber: 'Roll No. ${Get.find<HomeController>().studentsmodel.value.data?[index]?.rollNumber?? ''}', 
            onTap: (){
              Get.toNamed(Routes.ADD_ASSIGNMENT_FEEDBACK);
            }
            );
        },
        )
      ],
    );
  }
}
