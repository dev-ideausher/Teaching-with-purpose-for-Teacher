import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

import '../controllers/add_assignment_feedback_controller.dart';

class AddAssignmentFeedbackView
    extends GetView<AddAssignmentFeedbackController> {
  const AddAssignmentFeedbackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Assignment', isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 37.kh,
                  width: 183.kw,
                  color: context.kLightBlue,
                  child: Center(
                    child: Text(
                      'Class 8-A | Mathematics',
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              40.kheightBox,
              WidgetConstants.studentSection(
                image: Assets.images.studImg2.image(height: 56.kh, width: 56.kw),
                name: 'Esther Howard',
                rolNumber: '123456789',
                submitedOn: '05 July 2023, 12:00 pm',
              ),
              32.kheightBox,
              Text(
                'Assignment 1',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
              ),
              4.kheightBox,
              Text(
                'How are ordered pairs defined and how do they work? ',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400,
                color: context.kLightTextColor
               ),
              ),
              32.kheightBox,
              Text(
                'Answer',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              Container(
                height: 160.kh,
                width: double.infinity,
                color: context.kWhite,
                child: WidgetConstants.assignmentRowWidget(
                  onTap: () {},
                  onDawnload: () {},
                ),
              ),
              24.kheightBox,
              Text(
                'Marks',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
              ),
              8.kheightBox,
              Container(
                height: 56.kh,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.kWhite,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '_/50',
                      style: TextStyleUtil.kText16_5(
                          fontWeight: FontWeight.w400,
                          color: context.kLightTextColor),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Icon(Icons.visibility_outlined,
                            color: context.kPrimary, size: 15))
                  ],
                ),
              ),
              16.kheightBox,
              assignmentFeedbackWidget(),
            40.kheightBox,
            TButton(
            title: 'Submit',
            onTap: (){},
             ),
            ],
          ),
        ),
      ),
    );
  }

  Widget markdisributionWidget() {
    return Column(
      children: [],
    );
  }

  Widget assignmentFeedbackWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Areas of Improvement',
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
        ),
        16.kheightBox,
        CustomTextField(
          hint: 'Type here..',
          controller: controller.areaOfImprovementController,
          minLine: 6,
          maxLines: 8,
        ),
      24.kheightBox,
        Text(
          'Reviews',
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
        ),
      16.kheightBox, 
        CustomTextField(
          hint: 'Type here..',
          controller: controller.rivewsController,
          minLine: 6,
          maxLines: 8,
        ),     
      ],
    );
  }
}
