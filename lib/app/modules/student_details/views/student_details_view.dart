import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Student Details',isBack: true)),
      body: SingleChildScrollView(
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
                    Assets.images.studImglrg.image(height: 56.kh, width: 56.kw),
                    16.kwidthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Esther Howard',
                          style: TextStyleUtil.kText16_5(
                              fontWeight: FontWeight.w500),
                        ),
                        6.kheightBox,
                        Text('Roll No. : 123456789',
                            style: TextStyleUtil.kText14_4(
                                fontWeight: FontWeight.w400)),
                        6.kheightBox,
                        Row(
                          children: [
                            Text('Dob : 25/07/1999',
                                style: TextStyleUtil.kText14_4(
                                    fontWeight: FontWeight.w400)),
                            16.kwidthBox,
                            Text('Gender : Male',
                                style: TextStyleUtil.kText14_4(
                                    fontWeight: FontWeight.w400)),
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
              Text('Result',
                  style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              16.kheightBox,
            ],
          ),
        ),
      ),
    );
  }


  // widget for progress for selected student
  Widget progressWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.center,
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
            percentageIndicater(0.75, '75%', 'Cource completion',(){Get.toNamed(Routes.COURSE_COMPLETION);}),
            percentageIndicater(0.75, '75%', 'Assignment completion',(){Get.toNamed(Routes.ASSIGNMENT_COMPLETION);}),
            percentageIndicater(0.75, '75%', 'Exam score tracking',(){Get.toNamed(Routes.EXAM_SCORE);}),
            percentageIndicater(1, 'View', 'Student Behavior',(){Get.toNamed(Routes.STUDENT_BEHAVIOR);}),
          ],
        ),
        32.kheightBox,
      ],
    );
  }

  // prcentage progress indiacater for marks and all
  Widget percentageIndicater(double percent, String text1, String text2, void Function()onTap) {
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
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
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
                textAlign: TextAlign.center,
                title,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
            const Spacer(),
             const Icon(Icons.arrow_forward_ios,size: 15)
          ],
        ),
      ),
    );
  }
 
}
