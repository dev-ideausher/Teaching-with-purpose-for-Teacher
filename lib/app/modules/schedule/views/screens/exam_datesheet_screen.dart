import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_exam_sheet.dart';
import 'package:teaching_with_purpose/app/modules/schedule/controllers/schedule_controller.dart';
import 'dart:io' show Platform;
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class ExamDateSheetScreen extends GetView<ScheduleController> {
  const ExamDateSheetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
    body: SingleChildScrollView(
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
                ExamSheet(
                  title: 'Physics',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kLightred),
              16.kheightBox,
              ExamSheet(
                  title: 'Chemistry',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kPrimary),
              16.kheightBox,
              const ExamSheet(
                  title: 'English',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: Colors.amber),
              16.kheightBox,
              ExamSheet(
                  title: 'Mathematics',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kLightBlue),
              16.kheightBox,
              ExamSheet(
                  title: 'History',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kRed),
          ],
        ),
      ),
    ),
  
    );
  }





// appbar widget
  appBarWidget() {
    IconData iconData =
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Get.context!.kGreyBack,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(iconData, color: Get.context!.kPrimary),
      ),
      title: Text(
        textAlign: TextAlign.center,
        'Exam Datesheet',
        style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
      ),
    );
  }
}
