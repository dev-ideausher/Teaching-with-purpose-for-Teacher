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
    return DefaultTabController(
      initialIndex: controller.selectedTabIndex.value,
      length: 2,
      child: Scaffold(
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
                    ]))),
          body: TabBarView(
          controller: controller.tabController, 
          children: [
          buildBody(context),
          buildBody(context),
        ]),
      ),
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
        Text(
          'Add Questions',
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
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
          controller: controller.options1,
        ),
        8.kheightBox,
        CustomTextField(
          hint: 'Options2',
          controller: controller.options2,
        ),
        8.kheightBox,
        CustomTextField(
          hint: 'Options3',
          controller: controller.options3,
        ),
        8.kheightBox,
        CustomTextField(
          hint: 'Options4',
          controller: controller.options4,
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
                  // if (controller.isPreviewing.isTrue) {
                  //   controller.addQuestions();
                  // } else {
                  //   controller.togglePreviewMode();
                  //   showPreviewPopup(context);
                  // }
        }))
      ],
    );
  }

 
  Widget reviseQuestions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Questions',
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
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


void showPreviewPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildPreview(),
                16.kheightBox,
                SizedBox(
                  height: 56.kh,
                  width: double.infinity,
                  child: SizedBox(
                  height: 56.kh,
                  width: double.infinity,
                  child: TButton(
                    title: 'Edit',
                    onTap: () {
                      Get.back();
                      controller.togglePreviewMode();
                    },
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

  Widget buildPreview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Preview:',
            style:  TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
          ),
          16.kheightBox,
          buildPreviewRow('Question',controller. previewQuestion.value),
          buildPreviewRow('Options 1',controller. previewOptions1.value),
          buildPreviewRow('Options 2',controller. previewOptions2.value),
          buildPreviewRow('Options 3',controller. previewOptions3.value),
          buildPreviewRow('Options 4',controller. previewOptions4.value),
          buildPreviewRow('Solution',controller. previewSolution.value),
        ],
      ),
    );
  }

  Widget buildPreviewRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.kw,
            child: Text(
              '$label:',
              style:TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value,style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
