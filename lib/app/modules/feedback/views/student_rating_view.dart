import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/modules/feedback/controllers/feedback_controller.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class StudentRatingView extends GetWidget<FeedbackController> {
  const StudentRatingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
      child: CustomAppBar(title: 'My Feedback', isBack: true)),
      body: SingleChildScrollView(
        physics:const  BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Student’s Rating',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
            16.kheightBox,
          ratingWidget(
            qText: 'How is the general state of the class?',
          ),
          24.kheightBox,
          ratingWidget(
           qText:  'How is the course content?',
          ),
          24.kheightBox,
          ratingWidget(
            qText: 'Please evaluate the audio and visual connectivity.',
          ),
          24.kheightBox,
          ratingWidget(
            qText: 'The lecture in class was well-structured and coordinated.',
          ),
          24.kheightBox,
          ratingWidget(
            qText: 'The learning materials were readily available.',
          ),
          24.kheightBox,
          Text(
            'We would like to hear if you have any comments/suggestions about the course and class.',
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
          ), 
          8.kheightBox,
         SizedBox(
          height: 183.kh,
          width: double.infinity,
          child:Padding(
            padding: const EdgeInsets.fromLTRB(16,16, 16, 16),
            child: Text(
              StringConstants.onBoardTextSubtitle2,
              maxLines: 3,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
            ),
          ),
         )       
            ],
          ),
        ),
      ),
    );
  }

Widget ratingWidget({required String qText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        qText,
        textAlign: TextAlign.left,
        style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
      ),
      16.kheightBox,
      SizedBox(
        height: 48.kh,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => 16.kwidthBox,
          itemCount: 5,
          itemBuilder: (context, index) =>
              ratingNumbers(controller.ratingNumbers[index]),
        ),
      ),
    ],
  );
}

  Widget ratingNumbers(String text) {
  return InkWell(
        onTap: () {},
        child: Container(
          height: 40.kh,
          width: 40.kw,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Get.context!.kWhite,
            border: Border.all(
              color: Get.context!.kPrimary,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w500,
              color: Get.context!.kPrimary,
              ),
            ),
          ),
        )
      );
}
}