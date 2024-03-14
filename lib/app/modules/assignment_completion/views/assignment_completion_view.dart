import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:teaching_with_purpose/app/components/commom_loader.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_result_card.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

import '../../../components/custom_subjectvertical_card.dart';
import '../controllers/assignment_completion_controller.dart';

class AssignmentCompletionView extends GetView<AssignmentCompletionController> {
  const AssignmentCompletionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Assignment Completion',isBack: true)
      ),
      body: Obx(() => controller.isLoading.value
      ? const Loader()
      : SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 16),
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
                     double.parse(controller.assignmentTracking.value.data?.percentageSubmitted?? '0')/100, 
                    "${controller.assignmentTracking.value.data?.percentageSubmitted?? ''}%", 
                    'Assignment Performance', () {})),
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
              'Assignment Submitted',
              style:TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
            16.kheightBox,
              ListView.separated(
                shrinkWrap: true,
                physics: const  NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => 8.kheightBox, 
                itemCount: controller.assignmentTracking.value.data?.allAssignments?.length ?? 0,
                itemBuilder: (context, index) => CustomResultCard(
                  svg1: Assets.svg.editPencil,
                  title: 'Assignment',
                  subtitle: "Topic : ${controller.assignmentTracking.value.data?.allAssignments?[index]?.assignmentId?.title ?? ''}",
                  text1: 'Marks obtained: ',
                  text2: controller.assignmentTracking.value.data?.allAssignments?[index]?.assignmentId?.totalMarks ?? '',
                  svg2: Assets.svg.eye,
                  svg3: Assets.svg.download,
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
  final subjectLists = Get.find<SubjectsController>().subjectLists.value.data;

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
                        await controller.assignmentCompletionTracking(selectedSub: selectedSubjectId);
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
                textAlign: TextAlign.center,
                text2,
                style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
