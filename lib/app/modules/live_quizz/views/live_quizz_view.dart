


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/data/models/class_model.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../../../data/models/subjects_list_model.dart';
import '../controllers/live_quizz_controller.dart';

class LiveQuizzView extends GetView<LiveQuizzController> {
  const LiveQuizzView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Live Quiz',isBack: true,
       actions: [Assets.svg.upload.svg(height: 24.kh, width: 24.kw)])),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subject',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              selectSubjecttDropDawn(),
              16.kheightBox,
              Text(
                'Class',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              selectClassDropDawn(),
              16.kheightBox,
              Text(
                'Date and Time',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              Obx(() => CustomTextField(
                    hint: 'Select Date and Time',
                    controller: controller.dateAndTimeController.value,
                    onTap: () => controller.chooseDate(context),
                    suffixIcon: Icon(
                      Icons.calendar_month_outlined,
                      color: context.kPrimary,
                    ),
                  )),
              16.kheightBox,
              Text(
                'Duration of the quiz',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              CustomTextField(
                hint: 'Enter duration of the quiz',
                textInputType: TextInputType.number,
                controller: controller.questionsController,
              ),
              24.kheightBox,
              Text(
                'Instructions',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              CustomTextField(
                hint: 'Enter Instructions',
                controller: controller.instructionsController,
                minLine: 6,
                maxLines: 8,
              ),
              40.kheightBox,
              Row(
                children: [
                  Text(
                    'Add Questions',
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  GestureDetector(
                  onTap: (){
                    controller.addNewQuestion();
                  },
                  child: Assets.svg.plusCircle.svg()),
              4.kwidthBox,
              Text(
                'Add',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                color: context.kPrimary,
                ),
              ),
                ],
              ),
              24.kheightBox,
              Text(
                'Questions',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              CustomTextField(
                hint: 'Enter Questions',
                controller: controller.questionsController,
                minLine: 6,
                maxLines: 8,
              ),
              24.kheightBox,
              Text(
                'Options',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              CustomTextField(
                hint: 'Enter Options1',
                controller: controller.option1Controller,
              ),
              8.kheightBox,
              CustomTextField(
                hint: 'Enter Options2',
                controller: controller.option2Controller,
              ),
              8.kheightBox,
              CustomTextField(
                hint: 'Enter Options3',
                controller: controller.option3Controller,
              ),
              8.kheightBox,
              CustomTextField(
                hint: 'Enter Options4',
                controller: controller.option4Controller,
              ),
              24.kheightBox,
              Text(
                'Correct Answer',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              CustomTextField(
                hint: 'Enter Option Number',
                textInputType: TextInputType.number,
                controller: controller.answerController,
              ),
              24.kheightBox,
              Text(
                'Mark',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox, 
              CustomTextField(
                hint: 'mark',
                textInputType: TextInputType.number,
                controller: controller.markController,
              ),                                        
              40.kheightBox,
              SizedBox(
                height: 56.kh,
                width: 343.kw,
                child: TButton(title: 'Add', onTap: ()=> controller.createQuiz()),
              )
            ],
          ),
        ),
      ),
    );
  }



// subject dropDawn
  Widget selectSubjecttDropDawn() {
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<SubjectsListModelData?>(
              isExpanded: true,
              hint: Text(
                'Select Subject',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              items: controller.subjectsController.subjectItems
                  .map((SubjectsListModelData? item) {
                    return DropdownMenuItem<SubjectsListModelData?>(
                        value: item,
                        child: Text(
                          item?.subject ?? '',
                          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
                      );
                  }).toList(),
              value: controller.subjectsController.selectedSubject.value == ''
                  ? null
                  : controller.subjectsController.subjectItems.firstWhere(
                      (SubjectsListModelData? item) =>
                      item?.subject == controller.subjectsController.selectedSubject.value),
              onChanged: (SubjectsListModelData? value) {
                // log('Selected Subject: ${value?.subject}');
                //   controller.subjectsController.selectedSubject.value =
                //       value?.subject ?? '';
              controller.selectSubject(value);
              },

            ),
          ),
        ));
  }

// subject dropDawn
  Widget selectClassDropDawn() {
    return  Obx(() => Container(
  decoration: BoxDecoration(
    color: Get.context!.kWhite,
    borderRadius: BorderRadius.circular(8),
  ),
  child: DropdownButtonHideUnderline(
    child: DropdownButton2<ClassModelData?>(
      isExpanded: true,
      hint: Text(
        'Select Class',
        style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
      ),
      items: controller.subjectsController.classItems
          .map((ClassModelData? item) {
        return DropdownMenuItem<ClassModelData?>(
          value: item,
          child: Text(
            "${item?.className ?? ''}-${item?.section ?? ''}",
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
          ),
        );
      }).toList(),
      // value: controller.subjectsController.selectedClass.value != ''
      //     ? controller.subjectsController.classItems.firstWhere(
      //         (ClassModelData? item) =>
      //             "${item?.className}-${item?.section}" ==
      //             controller.subjectsController.selectedClass.value,
      //       )
      //     : null,
      onChanged: (ClassModelData? value) {
        // log('Selected Class: ${value?.className}-${value?.section}');
        // controller.subjectsController.selectedClass.value =
        //   "${value?.className}-${value?.section}";
      controller.selectClass(value);
      },
    ),
   ),
  ));
  }
}
