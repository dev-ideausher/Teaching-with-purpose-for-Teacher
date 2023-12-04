import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/modules/assignments/controllers/assignments_controller.dart';
import 'dart:io' show Platform;
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class AssignmentUplodedScreen extends GetWidget<AssignmentsController> {
  const AssignmentUplodedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              subjectDropDawn(),
              32.kheightBox,
              // DefaultTabController(
              //   length: 2,
              //   child: Column(
              //     children: [
              //       TabBar(
              //           controller: controller.tabController,
              //           indicatorWeight: 3,
              //           indicatorColor: context.kPrimary,
              //           labelColor: context.kPrimary,
              //           unselectedLabelColor: context.kLightTextColor,
              //           tabs: const [Text('Assigned'), Text('Submited')]),
              //       TabBarView(
              //           controller: controller.tabController,
              //           children: [Text('Assigned'), Text('Submited')])
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

// appbar widget
  appBarWidget() {
    IconData iconData =
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Get.context!.kGreyBack,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(iconData, color: Get.context!.kPrimary),
      ),
      title: Text(
        'Assignment',
        textAlign: TextAlign.center,
        style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
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
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select Subject',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
              ),
              items: controller.items
                  .map((String item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              value: controller.selectedSubject.value,
              onChanged: (String? value) => controller.selectSubject(value!),
            ),
          ),
        ));
  }
}
