import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

import '../../../components/custom_appbar.dart';
import '../../../constants/string_constants.dart';
import '../controllers/add_marks_controller.dart';

class AddMarksView extends GetView<AddMarksController> {
  const AddMarksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Marks',isBack: true)),
       body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 39),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Exam Type',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
            8.kheightBox,
              Obx(
                () => Container(
                  width: 343.kw,
                  height: 56.kh,
                  decoration: BoxDecoration(
                  color: context.kWhite,
                  borderRadius: BorderRadius.circular(8)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      items: [
                        DropdownMenuItem(value: 'Yearly', child: Text('Yearly',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                        DropdownMenuItem(value: 'Half-Yearly',child: Text('Half-Yearly',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                        DropdownMenuItem(value: 'Live Quiz',child: Text('Live Quiz',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                      ],
                      value: controller.selectedPeriod.value,
                      onChanged: (String? newValue) {
                        controller.selectedPeriod.value = newValue!;
                      },
                    ),
                  ),
                ),
              ),
            16.kheightBox,
              Text(
                'Marks',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              8.kheightBox,
            CustomTextField(hint: 'Enter marks', controller: controller.marksController,textInputType: TextInputType.number),
            16.kheightBox,
              Text(
                'Grades',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
            8.kheightBox,
            CustomTextField(hint: 'Enter grades', controller: controller.gradesController), 
            16.kheightBox,
              Text(
                'Pass or Fail',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              8.kheightBox,
              Obx(() => Container(
                  width: 343.kw,
                  height: 56.kh,
                  decoration: BoxDecoration(
                  color: context.kWhite,
                  borderRadius: BorderRadius.circular(8)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                        items: [
                          DropdownMenuItem(value: 'Pass',child: Text('Pass',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                          DropdownMenuItem(value: 'Fail',child: Text('Fail',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                        ],
                        value: controller.selectedResult.value,
                        onChanged: (String? newValue) {
                          controller.selectedResult.value = newValue!;
                        },
                      ),
                ),
              )),
              164.kheightBox,
                SizedBox(
                    width: 343.kw,
                    height: 56.kh,
                    child: TButton(title: StringConstants.submit, onTap: () {
                      log('onTaped');
                      controller.addMarkstoStudent();
                    })),
            ],
          ),
        ),
       ),
    );
  }
}
