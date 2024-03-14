import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teaching_with_purpose/app/components/commom_loader.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/student_details_controller.dart';

class StudentDetailsView extends GetView<StudentDetailsController> {
  const StudentDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.kGreyBack,
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Student Details', isBack: true)
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
              SizedBox(
                height: 94.kh,
                width: 343.kw,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: SizedBox(
                        height: 56.kh,
                        width: 56.kw,
                        child: controller.studentsData.value.image!.isNotEmpty || controller.studentsData.value.image!= null
                        ? Image.network(controller.studentsData.value.image?? '',
                           fit: BoxFit.cover,
                      )
                    : Assets.images.studImglrg.image(height: 56.kh,width: 56.kw),
                    ),
                  ),
                    16.kwidthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.studentsData.value.name?? '',
                          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                        ),
                        6.kheightBox,
                        Text(
                         'Roll No. : ${controller.studentsData.value.rollNumber?? ''}',
                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                        6.kheightBox,
                        Row(
                          children: [
                            Text(
                              'Dob : 25/07/1999',
                              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                            16.kwidthBox,
                            Text(
                              'Gender : ${controller.studentsData.value.gender?? ''}',
                              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              32.kheightBox,
              progressWidget(),
              32.kheightBox,
              educationProfileWidget(
                  Assets.svg.eduProfile, 'Education Profile', () {}),
              32.kheightBox,
              Text(
              'Result',
               style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              16.kheightBox,
              examMarkWidget(),
            ],
          ),
        ),
      ),
      )
    );
  }
  // widget for progress for selected student
  Widget progressWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Progress',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        ),
        16.kheightBox,
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.352,
            crossAxisCount: 2,
            crossAxisSpacing: 13,
            mainAxisSpacing: 16,
          ),
          children: [
            percentageIndicater(
             percent:  double.parse(controller.courseCompletion.value.data?.overallPercentage ?? '0')/100, 
             percentText:  "${controller.courseCompletion.value.data?.overallPercentage??''}%", 
             trackingText:  'Cource completion',
             onTap:  (){ 
              String? studentId = controller.studentsData.value.Id;
              Get.toNamed(Routes.COURSE_COMPLETION,arguments: {'studentId':studentId});
            }),
            percentageIndicater(
             percent:  double.parse(controller.assignmentTracking.value.data?.percentageSubmitted?? '0')/100, 
             percentText:"${controller.assignmentTracking.value.data?.percentageSubmitted?? ''}%", 
             trackingText:  'Assignment completion',
             onTap: (){
              String? studentId = controller.studentsData.value.Id;
              Get.toNamed(Routes.ASSIGNMENT_COMPLETION,arguments: {'studentId':studentId});
            }),
            percentageIndicater(
             percent:  0.75, 
             percentText:  '75%', 
             trackingText:  'Exam score tracking',
             onTap: (){ 
              Get.toNamed(Routes.EXAM_SCORE);
            }),
            percentageIndicater(
             percent:  1, 
             percentText:  'View', 
             trackingText:  'Student Behavior',
             onTap:  (){ 
             Get.toNamed(Routes.STUDENT_BEHAVIOR);
          }),
          ],
        ),
        32.kheightBox,
      ],
    );
  }
  // prcentage progress indiacater for marks and all
  Widget percentageIndicater({required double percent, required String percentText, required String trackingText, void Function()? onTap}) {
    return InkWell(
    onTap: onTap,
    child: Container(
      width: 165.kw,
      height: 122.kh,
      decoration: BoxDecoration(
        color: Get.context!.kWhite,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 30,
              lineWidth: 8,
              progressColor: Get.context!.kPrimary,
              backgroundColor: Get.context!.kLightSkyBlue,
              animation: true,
              percent: percent,
              center: Text( percentText,style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
            ),
            8.kheightBox,
            Text( 
            trackingText,
            textAlign: TextAlign.center,
            style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    ),
  );
  }
//.......
  Widget educationProfileWidget(
      SvgGenImage image, String title, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 57.kh,
        width: 343.kw,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Get.context!.kWhite),
        child: Row(
          children: [
            image.svg(),
            16.kwidthBox,
            Text(
             title,
             style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
            const Spacer(),
             const Icon(Icons.arrow_forward_ios,size: 15)
          ],
        ),
      ),
    );
  }

 Widget examMarkWidget() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Subjects', style:TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              Text('Grade', style:TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              Text('Mark', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))
            ],
          ),
        ),
        24.kheightBox,
        SizedBox(
          width: double.infinity,
          child: Column(
            children: List.generate(controller.examMarkModel.value.data?.length?? 0,
                (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(controller.examMarkModel.value.data?[index]?.subject?.subject?? '',
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                      color:Get.context!.kLightTextColor)),
        
                  Text(controller.examMarkModel.value.data?[index]?.markId?.grade?? '',
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                      color:Get.context!.kLightTextColor)),
        
                  Text(controller.examMarkModel.value.data?[index]?.markId?.marks.toString() ?? '',
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                      color: Get.context!.kLightTextColor))
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
