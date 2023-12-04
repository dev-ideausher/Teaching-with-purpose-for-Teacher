import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'dart:io' show Platform;
import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Date Range',
                textAlign: TextAlign.center,
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              16.kheightBox,
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: 'Select date',
                      textInputType: TextInputType.datetime,
                      suffixIcon: Icon(
                        Icons.calendar_month_rounded,
                        color: context.kPrimary,
                      ),
                      controller: controller.fromController,
                    ),
                  ),
                  Text(
                    'to',
                    textAlign: TextAlign.center,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
                  Expanded(
                    child: CustomTextField(
                      hint: 'Select date',
                      textInputType: TextInputType.datetime,
                      controller: controller.toController,
                      suffixIcon: Icon(
                        Icons.calendar_month_rounded,
                        color: context.kPrimary,
                      ),
                    ), 
                  ),
                ],
              ),
              32.kheightBox,
              Text(
                'Attendance',
                textAlign: TextAlign.center,
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              16.kheightBox,
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
        'Attendance',
        textAlign: TextAlign.center,
        style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
      ),
    );
  }


//
}

