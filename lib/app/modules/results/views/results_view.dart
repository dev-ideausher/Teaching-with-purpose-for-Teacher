import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import '../controllers/results_controller.dart';

class ResultsView extends GetView<ResultsController> {
  const ResultsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Results',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            children: [
              Text(
                'Class',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              buildClassDropdawn(),
              Text(
                'Subject',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              buildSubjectDropdawn(),
              32.kheightBox,
              ListView.separated(
               separatorBuilder:(context, index) => 8.kheightBox,
               itemCount: 2,
              itemBuilder: (context, index) {
                return;
              },
            )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildClassDropdawn(){
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select Classes',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,
                    color: Get.context!.kLightTextColor),
              ),
              items: controller.classes
                  .map((String item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              value: controller.selectedValue.value,
              onChanged: (String? value) => controller.selectClass(value!),
            ),
          ),
        ));
  }

  Widget buildSubjectDropdawn(){
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select Subject',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,
                    color: Get.context!.kLightTextColor),
              ),
              items: controller.items
                  .map((String item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              value: controller.selectedSubject.value,
              onChanged: (String? value) => controller.selectSubject(value!),
            ),
          ),
        ));
  }
}
