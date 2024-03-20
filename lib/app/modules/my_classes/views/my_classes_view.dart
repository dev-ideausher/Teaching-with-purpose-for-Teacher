
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_studentcard.dart';
import 'package:teaching_with_purpose/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../controllers/my_classes_controller.dart';

class MyClassesView extends GetView<MyClassesController> {
  const MyClassesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.kh), 
      child: CustomAppBar(
        title: 'My Classes',
        isBack: true,
        bottom: TabBar(
          controller: controller.tabController,
          indicatorColor: context.kPrimary,
          labelColor: context.kPrimary,
          unselectedLabelColor: context.kLightTextColor,
            tabs:  const [
              Text('Students'), 
              Text("Subject(s)"),
        ],
      onTap: (index) => controller.selctedTabIndex.value,
      ),
     ),
    ),
      body: TabBarView(
          controller: controller.tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
              checkTabs(), 
              checkTabs(),
        ]),
    );
  }

  Widget checkTabs() {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                controller.selctedTabIndex.value == 0
                    ? studentsWidget()
                    : subjectWidget()
              ],
            ),
          ),
        ));
  }
//......
  Widget studentsWidget() {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
           separatorBuilder: (context, index) => 8.kheightBox, 
           itemCount: Get.find<HomeController>().studentsmodel.value.data?.length?? 0,
          itemBuilder: (context, index) => CustomStudentCard(
          stdImage: Image.network(Get.find<HomeController>().studentsmodel.value.data?[index]?.image?? ''),
          text1: Get.find<HomeController>().studentsmodel.value.data?[index]?.name?? '',
          text2: 'Roll No. - ${Get.find<HomeController>().studentsmodel.value.data?[index]?.rollNumber?? ''}',
          icon: Assets.svg.arrowFwd,
          onTap: () {
            final data = Get.find<HomeController>().studentsmodel.value.data?[index];
            Get.toNamed(Routes.STUDENT_DETAILS,arguments: data);
          },
        ),
      ),
      ],
    );
  }
//........
  Widget subjectWidget() {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => 8.kheightBox, 
          itemCount: Get.find<HomeController>().subjectLists.value.data?.length?? 0,
          itemBuilder: (context, index) => WidgetConstants.subjectViewHorizontal(
            subject: Get.find<HomeController>().subjectLists.value.data?[index]?.subject?? '',
            onTap:(){
            // final selectedSubject = Get.find<SubjectsController>().subjectLists.value.data?[index];
            }
          ), 
        )
      ],
    );
  }
}
