import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

import '../controllers/add_chapters_controller.dart';

class AddChaptersView extends GetView<AddChaptersController> {
  const AddChaptersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String selectedSubjectName = controller.subjectName;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: selectedSubjectName,isBack: true)),
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
        Row(
          children: [
            Text(
              'Add Concepts',
              style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
            ),
             Spacer(),
            Assets.svg.plusCircle.svg(),
            GestureDetector(
              onTap: (){},
              child: Text(
                'Add concepts',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                color: Get.context!.kPrimary),
              ),
            ),
          ],
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
              buildAddButton(
                  text: 'Upload Video',
                  onTap: () async {
                controller.pickVideoFile();
            }),
            16.kheightBox,
            Obx(() =>Visibility(
              visible: controller.selectedFile.value.isNotEmpty,
              replacement: const SizedBox.shrink(),
                 child: Text(
                  controller.selectedFile.value,
                  style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                   ),
               ),),
            16.kheightBox,
            // buildAddQuestionWidget(title: 'Add Questions', onTap:()=> Get.toNamed(Routes.ADD_QUESTIONS)),
          buildAddButton(
            text: 'Upload PDF Content',
            onTap: ()  {
              showPickPdfBottomSheet();
          }),
          32.kheightBox,
                TButton(title: controller.isPreviewing.isTrue ? 'Submit' : StringConstants.save, 
                onTap: (){
                controller.addChapter();
                // if(controller.isPreviewing.isTrue){
                // controller.addChapter();
                // }else{
                // controller.previewMode();
                // showPreviewPopup(context);
                // }
                })  
            ],
          ),
        ),
       ),
    );
  }

 void showPickPdfBottomSheet() {
    Get.bottomSheet(
      backgroundColor: Get.context!.kWhite,
      Container(
        width: 375.kw,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 53),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('File Upload',
              style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400,
              color: Get.context!.kLightTextColor)),
              16.kheightBox,
              Text('File Name',
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
              16.kheightBox,
              Obx(
                () => Visibility(
                  visible: controller.selectedPdf.value.isNotEmpty,
                  replacement: const SizedBox.shrink(),
                  child: CustomTextField(
                  hint: 'Enter File Name', 
                  controller: controller.pdfController,
                  readOnly: true,
                 )
                ),
              ),
              32.kheightBox,
              buildAddButton(
                  text: 'Upload PDF',
                  onTap: () async {
                    controller.pickPdfFile();
                  }),
              16.kheightBox,
              TButton(
                  title: 'Continue',
                  onTap: () {
                    Get.back();
                  })
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

}

