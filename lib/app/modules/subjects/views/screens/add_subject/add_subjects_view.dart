import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/add_subjects_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class AddSubjectsView extends GetView<AddSubjectsController>{
  const AddSubjectsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Mathematics',isBack: true)),
       body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Chapter Name',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
            16.kheightBox,
              CustomTextField(
                hint: 'Enter Chapter Name',
                controller: controller.chapterNameController,
              ),
            32.kheightBox,
               Text(
                'Add Concepts',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
              ),
            32.kheightBox,
               Text(
                'Name',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
            16.kheightBox,
              CustomTextField(
                hint: 'Enter Concept Name',
                controller: controller.topicNameController,
              ),
            16.kheightBox,
               Text(
                'Description',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
            16.kheightBox,
              CustomTextField(
                hint: 'Enter Description',
                controller: controller.topicDescriptionController,
                minLine: 6,
                maxLines: 8,
              ),
            16.kheightBox,
               Text(
                'Video Content',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
            16.kheightBox,
            buildAddButton(text: 'Upload Video',onTap: (){}),
            16.kheightBox,
               Text(
                'Questions',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
            16.kheightBox,
            // buildAddQuestionWidget(title: 'Add Questions', onTap:()=> Get.toNamed(Routes.ADD_QUESTIONS)),
            40.kheightBox,
            buildAddButton(text: 'Upload PDF Content',onTap: (){}),
          32.kheightBox,
                SizedBox(
                    width: 343.kw,
                    height: 56.kh,
                    child: TButton(title: StringConstants.save, onTap: (){Get.offAllNamed(Routes.ADD_QUESTIONS);}))          
            ],
          ),
        ),
       ),
    );
  }

Widget buildAddButton({required String text,required void Function() onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 56.kh,
      width: 343.kw,
      decoration: BoxDecoration(
        border: Border.all(color: Get.context!.kPrimary),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add,color:  Get.context!.kPrimary),
              Text(
                text,
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w500, color: Get.context!.kPrimary),
              ),
            ],
          ),
        ),
    ),
  );
}


  Widget buildAddQuestionWidget({ required String title, required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 57.kh,
        width: 343.kw,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Get.context!.kWhite),
        child: Row(
          children: [
            Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
            const Spacer(),
             const Icon(Icons.arrow_forward_ios,size: 15)
          ],
        ),
      ),
    );
  }
}