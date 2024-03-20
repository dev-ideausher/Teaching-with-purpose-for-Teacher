import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/commom_loader.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_chapterwise_card.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../components/custom_subjectvertical_card.dart';
import '../controllers/course_completion_controller.dart';

class CourseCompletionView extends GetView<CourseCompletionController> {
  const CourseCompletionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Course Completion', isBack: true)
    ),
      body: Obx(() => controller.isLoading.value
      ? const Loader()
      : SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subjectsWidget(),
              32.kheightBox,
              SizedBox(
                height: 119.kh,
                width: 343.kw,
                child: Stack(
                  children: [
                    Center(
                    child: percentageIndicater(
                    double.parse(controller.courseCompletion.value.data?.overallPercentage ?? '0')/300, 
                    "${controller.courseCompletion.value.data?.overallPercentage??''}%", 
                    'Course completion', (){},
                    )),
                    Align(
                      alignment: Alignment.topRight,
                      child: Assets.images.gpdEllipsLargeright.image(),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Assets.images.gpdEllipsLargeleft.image(),
                    )
                  ],
                ),
              ),
              32.kheightBox,
            Text(
              'Chapter Wise',
              style:TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              16.kheightBox,
              ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => 8.kheightBox, 
              itemCount: controller.courseCompletion.value.data?.chaptersWithProgress?.length??0,
              itemBuilder: (context, index) => CustomChapterWiseCard(
                  img: Assets.svg.editPencil,
                  text1: "${controller.courseCompletion.value.data?.chaptersWithProgress?[index]?.chapterDetails?.chapterName?? ''} :",
                  text2: controller.courseCompletion.value.data?.chaptersWithProgress?[index]?.chapterDetails?.concept?? '',
                  text3: "Progress : ${controller.courseCompletion.value.data?.chaptersWithProgress?[index]?.progress}",
                  widget: LinearPercentIndicator(
                  animation: true,
                  width: 253.kw,
                  lineHeight: 4.kh,
                  percent: double.parse(controller.courseCompletion.value.data?.chaptersWithProgress?[index]?.progress ?? '0')/100,
                  progressColor: Get.context!.kPrimary,
                ),
              ),
              ),
            ],
          ),
        ),
      ),
     )
    );
  }
  // display subjects
  Widget subjectsWidget() {
  final subjectLists = Get.find<HomeController>().subjectLists.value.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subjects',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        ),
        16.kheightBox,
        SizedBox(
          height: 101.kh,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => 16.kwidthBox,
              itemCount: subjectLists?.length ?? 0,
              itemBuilder: (context, index) => Obx(() {
                    final isSelected = controller.selectedSubjectIndex.value == index;
                    String? selectedSubjectId = subjectLists?[index]?.Id;
                    return InkWell(
                      onTap: () async{
                        controller.selectedSubjectIndex.value = index;
                        await controller.courseCompletionTracking(selectedSub: selectedSubjectId);
                      },
                      child: CustomSubjectCardVertical(
                        text: subjectLists?[index]?.subject ?? '',
                        color: isSelected ? context.kRed : context.kWhite,
                        svgImage: controller.subjectImage[index],
                      ),
                    );
                  })),
        ),
      ],
    );
  }
//percentage indicater .........
  Widget percentageIndicater(
      double percent, String text1, String text2, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 165.kw,
        height: 122.kh,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            children: [
              CircularPercentIndicator(
                radius: 30,
                lineWidth: 8,
                progressColor: Get.context!.kPrimary,
                animation: true,
                percent: percent,
                center: Text(text1,
                    style:
                        TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
              ),
              8.kheightBox,
              Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
