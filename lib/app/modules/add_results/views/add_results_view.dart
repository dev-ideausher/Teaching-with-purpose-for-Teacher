import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/custom_appbar.dart';
import '../../../components/custom_textfield.dart';
import '../../../services/text_style_util.dart';
import '../controllers/add_results_controller.dart';

class AddResultsView extends GetView<AddResultsController> {
  const AddResultsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final studentData = controller.studentsData.value;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Results', isBack: true)),
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: studentData.image == null
                            ? Assets.images.studImg1.image(height: 56.kh, width: 56.kw, fit: BoxFit.cover)
                            : CachedNetworkImage(imageUrl: studentData.image ?? '',height: 56.kh,width: 56.kw,fit: BoxFit.cover),
                      ),
                      16.kwidthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${studentData.name}',
                            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                          ),
                          8.kheightBox,
                          Text(
                            'Roll No. : ${studentData.rollNumber}',
                            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              24.kheightBox,
              Obx(() => Container(
                    width: 343.kw,
                    height: 56.kh,
                    decoration: BoxDecoration(
                        color: context.kWhite,
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        items: [
                          DropdownMenuItem(
                              value: 'Yearly',
                              child: Text('Yearly',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                          DropdownMenuItem(
                              value: 'Half-Yearly',
                              child: Text('Half-Yearly',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                          DropdownMenuItem(
                              value: 'Assignment',
                              child: Text('Assignment', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                          DropdownMenuItem(
                              value: 'Live Quiz',
                              child: Text('Live Quiz',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                        ],
                        value: controller.selectedExamType.value,
                        onChanged: (String? newValue) {
                          controller.selectedExamType.value = newValue!;
                        },
                      ),
                    ),
                  )),
              32.kheightBox,
              Text(
                'Result',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              16.kheightBox,
              buildSelectedWidget(),
              32.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Areas of improvement',
                    style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
                  ),
                  Assets.svg.addPlus.svg(height: 20.kh, width: 20.kw)
                ],
              ),
              16.kheightBox,
              Text(
                'Topic/Concept Name',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              CustomTextField(
                  hint: 'Enter Topic/Concept Name',
                  controller: controller.topicController),
              8.kheightBox,
              Text(
                'Performance',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              Obx(() => Container(
                    width: 343.kw,
                    height: 56.kh,
                    decoration: BoxDecoration(
                        color: context.kWhite,
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        items: [
                          DropdownMenuItem(
                              value: 'Poor',
                              child: Text('Poor',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                          DropdownMenuItem(
                              value: 'Average',
                              child: Text('Average',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                          DropdownMenuItem(
                              value: 'Good',
                              child: Text('Good',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                          DropdownMenuItem(
                              value: 'Excellent',
                              child: Text('Excellent',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
                        ],
                        value: controller.selectedPerformance.value,
                        onChanged: (String? newValue) {
                          controller.selectedPerformance.value = newValue!;
                        },
                      ),
                    ),
                  )),
              8.kheightBox,
              Text(
                'Remarks',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              CustomTextField(
                  hint: 'Enter remarks',
                  minLine: 4,
                  maxLines: 8,
                  controller: controller.remarksController),
              40.kheightBox,
              SizedBox(
                  width: 343.kw,
                  height: 56.kh,
                  child: TButton(title: StringConstants.submit, onTap: () {
                    controller.postResults();
                  })),
            ],
          ),
        ),
      ),
    );
  }


Widget buildSelectedWidget() {
    final widgetMap = {
      'Yearly': examMarkWidget(),
      'Half-Yearly': examMarkWidget(),
      'Assignment': assignmentWidget(),
      'Live Quiz': quizWidget(),
    };

    return Obx(() => widgetMap[controller.selectedExamType.value] ?? Container());
  }



Widget examMarkWidget() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Subjects', style:TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              Text('Grade', style:TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              Text('Mark', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))
            ],
          ),
        ),
        24.kheightBox,
        SizedBox(
          width: double.infinity,
          child: Column(
            children: List.generate(6,
                (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Physics',
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color:Get.context!.kLightTextColor)),
        
                  Text('A',
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color:Get.context!.kLightTextColor)),
        
                  Text('88',
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))
                ],
              );
            }),
          ),
        ),
      ],
    );
  }


Widget assignmentWidget() {
    return WidgetConstants.resultCard(type: 'Assignment 1', topic: 'Topic: Ordered Pair', mark: '23/30');
  }

Widget quizWidget() {
    return WidgetConstants.resultCard(type: 'Quiz 1', topic: 'Topic: Ordered Pair', mark: '23/30');
  }
}