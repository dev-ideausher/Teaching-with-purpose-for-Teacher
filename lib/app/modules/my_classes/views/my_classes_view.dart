import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:teaching_with_purpose/app/components/custom_studentcard.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../controllers/my_classes_controller.dart';

class MyClassesView extends GetView<MyClassesController> {
  const MyClassesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: context.kGreyBack,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                  color: context.kPrimary,
                )),
            elevation: 0,
            centerTitle: true,
            title: Text(
              'My Classes',
              style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
            ),
            bottom: TabBar(
                controller: controller.tabController,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
                indicatorWeight: 3,
                indicatorColor: context.kPrimary,
                labelColor: context.kPrimary,
                unselectedLabelColor: context.kLightTextColor,
                tabs: const [Text('Students'), Text("Subject(s)")]),
          ),
          body: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [checkTabs(), checkTabs()]),
        ));
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
        CustomStudentCard(
          stdImage: Assets.images.studImg1.image(),
          text1: 'Esther Howard',
          text2: 'Roll No. - 1',
          icon: Assets.svg.arrowFwd,
          onTap: () => Get.toNamed(Routes.STUDENT_DETAILS),
        ),
        8.kheightBox,
        CustomStudentCard(
          stdImage: Assets.images.studImg2.image(),
          text1: 'Ralph Edwards',
          text2: 'Roll No. - 2',
          icon: Assets.svg.arrowFwd,
          onTap: () {},
        ),
        8.kheightBox,
        CustomStudentCard(
          stdImage: Assets.images.studImg3.image(),
          text1: 'Jacob Jones',
          text2: 'Roll No. - 3',
          icon: Assets.svg.arrowFwd,
          onTap: () {},
        ),
        8.kheightBox,
        CustomStudentCard(
          stdImage: Assets.images.studImg4.image(),
          text1: 'Jane Cooper',
          text2: 'Roll No. - 4',
          icon: Assets.svg.arrowFwd,
          onTap: () {},
        ),
      ],
    );
  }
//........
  Widget subjectWidget() {
    return SizedBox(
      height: 56.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 40.kh,
                  width: 40.kw,
                  child: Center(
                    child: Assets.svg.mathsSmall.svg(),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Assets.images.grupedEllipseSmall.image(),
                )
              ],
            ),
            16.kwidthBox,
            Text(
              'Mathematics',
              textAlign: TextAlign.center,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
