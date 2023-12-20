import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

import '../controllers/add_questions_controller.dart';

class AddQuestionsView extends GetView<AddQuestionsController> {
  const AddQuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller.selectedTabIndex.value,
      length: 2,
      child: Scaffold(
      appBar:  PreferredSize(preferredSize: Size.fromHeight(100.kh),
         child: CustomAppBar(title: 'Mathematics',isBack: true,
         bottom:TabBar(
              controller: controller.tabController,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
              indicatorWeight: 3,
              indicatorColor: context.kPrimary,
              labelColor: context.kPrimary,
              unselectedLabelColor: context.kLightTextColor,
          tabs: const [
                Tab(text: 'Questions'),
                Tab(text: 'Revsion Questions'),
          ]
        ))),
      body: TabBarView(
      controller: controller.tabController,
       children: [
          buildBody(),
          buildBody(),
        ]),
      ),
    );
  }

  
 Widget buildBody(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
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
                    child: TButton(title: 'Add', onTap: ()=> controller.addQuestions()))         
        ],
      ),
    ),
  );
 }
}
