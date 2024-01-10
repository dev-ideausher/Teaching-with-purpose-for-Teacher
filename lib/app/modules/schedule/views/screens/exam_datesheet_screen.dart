import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_exam_sheet.dart';
import 'package:teaching_with_purpose/app/modules/schedule/controllers/schedule_controller.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class ExamDateSheetScreen extends GetView<ScheduleController> {
  const ExamDateSheetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.kh),
        child: CustomAppBar(title: 'Exam Datesheet', isBack: true),
      ),
    body: Obx(() => controller.isLoding.value?
    Center(child: CircularProgressIndicator(color: context.kPrimary)):
    SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Container(
                height: 37.kh,
                width: 80.kw,
                color: context.kLightBlue,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Class 8th',
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              40.kheightBox,
              ListView.separated(
                shrinkWrap: true,
                 separatorBuilder: (context, index) => 16.kheightBox,
                 itemCount: controller.examsheetmodel.value.data?.length?? 0,
                itemBuilder: (context, index) => ExamSheet(
                title: controller.examsheetmodel.value.data?[index]?.examTitle?? '',
                text1: 'Date: 07 July 2023',
                text2: 'Time: ${controller.examsheetmodel.value.data?[index]?.examTime?? ''}',
                text3: 'Full marks: ${controller.examsheetmodel.value.data?[index]?.fullMarks?? ''}',
                text4: 'Passing marks: ${controller.examsheetmodel.value.data?[index]?.passingMarks?? ''}',
                borderColor: context.kLightred),
                            ),
          ],
        ),
      ),
    ),
    )
  
    );
  }
}
 