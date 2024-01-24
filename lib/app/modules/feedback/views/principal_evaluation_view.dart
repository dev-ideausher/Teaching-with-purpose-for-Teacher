import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/modules/feedback/controllers/feedback_controller.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class PrincipalEvaluationView extends GetWidget<FeedbackController> {
  const PrincipalEvaluationView({Key? key}) : super(key: key);
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
                'Principal’s Evaluation',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
            16.kheightBox,
            Container(
              height: 80.kh,
              width: 343.kw,
              color: context.kLightBlue,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Row(
                children: [
                Expanded(
                  child: Text(
                    'Performance Criteria',
                    maxLines: 2,
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                  ),
                ),
                150.kwidthBox,
                Text(
                  'Rating',
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                ),                
                ],
                ),
              ),
            ),
          buildEvaluationWidget(criteria: 'Attendance and Punctuality',rating: '4'),
          const Divider(),
          buildEvaluationWidget(criteria: 'Classroom Observation',rating: '5'),
          const Divider(),
          buildEvaluationWidget(criteria: 'Course Content',rating: '4'),
          const Divider(),
          buildEvaluationWidget(criteria: 'Student Assessment Results',rating: '5'),
          const Divider(),
          buildEvaluationWidget(criteria: 'Student Test Scores',rating: '4'),
          const Divider(),
          
            ],
          ),
        ),
      ),
    );
  }
  Widget buildEvaluationWidget({String? criteria, String? rating}){
   return SizedBox(
    height: 57.kh,
    width: 343.kw,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text(
              criteria!,
              style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
            ),
            Text(
              rating!,
              style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
            ),     
        ],
      ),
    ),
   );
  }
}