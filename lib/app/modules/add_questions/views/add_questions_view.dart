import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

import '../controllers/add_questions_controller.dart';

class AddQuestionsView extends GetView<AddQuestionsController> {
  const AddQuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  String selectedSubjectName = controller.subjectName;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.kh),
          child: CustomAppBar(
              title: selectedSubjectName,
              isBack: true,
              actions: [
              Assets.svg.upload.svg(height: 20.kh,width: 20.kw)
              ],
              bottom: TabBar(
                  controller: controller.tabController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  indicatorColor: context.kPrimary,
                  labelColor: context.kPrimary,
                  unselectedLabelColor: context.kLightTextColor,
                  tabs: [
                    SizedBox(width: 171.kw, child: const Tab(text: 'Questions')),
                    SizedBox(width: 171.kw, child: const Tab(text: 'Revsion Questions')),
                  ],
          onTap: (value) => controller.selectedTabIndex.value,
        ))),
        body: TabBarView(
        controller: controller.tabController, 
        children: [
        buildBody(context),
        buildBody(context),
      ]),
    );
  }

  
 Widget buildBody(BuildContext context){
  return Obx(() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         controller.selectedTabIndex.value == 0? questionWidgets(context): reviseQuestions(context)
        ],
      )
    ),
  ));
 }

  Widget questionWidgets(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Add Questions',
              style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
            ),
             Spacer(),
            Assets.svg.plusCircle.svg(),
            GestureDetector(
              onTap: (){
                controller.addMoreQuestions();
              },
              child: Text(
                'Add',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                color: Get.context!.kPrimary),
              ),
            ),
          ],
        ),
        32.kheightBox,
        Text(
          'Question',
          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
        ),
        16.kheightBox,
        CustomTextField(
          hint: 'Enter Question',
          controller: controller.questionController,
          minLine: 6,
          maxLines: 8,
        ),
        32.kheightBox,
        Text(
          'Enter Options',
          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
        ),
        16.kheightBox,
        CustomTextField(
          hint: 'Options1',
          controller: controller.options1Controller,
        ),
        8.kheightBox,
        CustomTextField(
          hint: 'Options2',
          controller: controller.options2Controller,
        ),
        8.kheightBox,
        CustomTextField(
          hint: 'Options3',
          controller: controller.options3Controller,
        ),
        8.kheightBox,
        CustomTextField(
          hint: 'Options4',
          controller: controller.options4Controller,
        ),
        35.kheightBox,
        Text(
          'Solution',
          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
        ),
        16.kheightBox,
        CustomTextField(
          hint: 'Enter Solution',
          controller: controller.solutionController,
          minLine: 6,
          maxLines: 8,
        ),
        32.kheightBox,
        SizedBox(
            width: 343.kw,
            height: 56.kh,
            child: TButton(
                title: 'Add',
                onTap: () {
                controller.addQuestions();
        }))
      ],
    );
  }

 
  Widget reviseQuestions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Add Questions',
              style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
            ),
             Spacer(),
            Assets.svg.plusCircle.svg(),
            GestureDetector(
              onTap: (){},
              child: Text(
                'Add',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                color: Get.context!.kPrimary),
              ),
            ),
          ],
        ),
        32.kheightBox,
        Text(
          'Question',
          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
        ),
        16.kheightBox,
        CustomTextField(
          hint: 'Enter Question',
          controller: controller.reviseQuestionController,
          minLine: 6,
          maxLines: 8,
        ),
        32.kheightBox,
        Text(
          'Enter Options',
          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
        ),
        16.kheightBox,
        CustomTextField(
          hint: 'Options1',
          controller: controller.reviseOptions1,
        ),
        8.kheightBox,
        CustomTextField(
          hint: 'Options2',
          controller: controller.reviseOptions2,
        ),
        8.kheightBox,
        CustomTextField(
          hint: 'Options3',
          controller: controller.reviseOptions3,
        ),
        8.kheightBox,
        CustomTextField(
          hint: 'Options4',
          controller: controller.reviseOptions4,
        ),
        35.kheightBox,
        Text(
          'Solution',
          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
        ),
        16.kheightBox,
        CustomTextField(
          hint: 'Enter Solution',
          controller: controller.reviseSolutionController,
          minLine: 6,
          maxLines: 8,
        ),
        32.kheightBox,
        SizedBox(
            width: 343.kw,
            height: 56.kh,
            child: TButton(title: 'Add', onTap: () {
            controller.addReviseQuestions();
            }))
      ],
    );
  }
}
