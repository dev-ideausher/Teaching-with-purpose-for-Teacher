import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({Key? key}) : super(key: key);
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
              WidgetConstants.profileSectionWidget(Assets.svg.feedback, 'Student’s Rating', 
              () => Get.toNamed(Routes.STUDENT_RATING)),
              16.kheightBox,
              WidgetConstants.profileSectionWidget(Assets.svg.feedback, 'Principal’s Evaluation', 
              ()=> Get.toNamed(Routes.PRINCIPALS_EVALUATION)),
            ],
          ),
        ),
      ),
    );
  }
}
