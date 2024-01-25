import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

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
            buildAddButton(text: 'Upload PDF Content',
                  onTap: () async {
                controller.pickPdfFile();            
            }
          ),
          16.kheightBox,
            Obx(() =>Visibility(
              visible: controller.selectedPdf.value.isNotEmpty,
              replacement: const SizedBox.shrink(),
                 child: Text(
                  controller.selectedPdf.value,
                  style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                   ),
               ),),
          32.kheightBox,
                SizedBox(
                    width: 343.kw,
                    height: 56.kh,
                    child: TButton(title: controller.isPreviewing.isTrue ? 'Submit' : StringConstants.save, 
                    onTap: (){
                    if(controller.isPreviewing.isTrue){
                    controller.addChapter();
                    }else{
                    controller.previewMode();
                    showPreviewPopup(context);
                    }
                    }))          
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
                      controller.previewMode();
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
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
          ),
          16.kheightBox,
          buildPreviewRow('Chapter Name',controller. previewChapterName.value),
          buildPreviewRow('Topic Name', controller. previewTopicName.value),
          buildPreviewRow('Topic Description',controller. previewTopicDescription.value),
          buildPreviewRow('Selected File',controller. previewSelectedFile.value),
          buildPreviewRow('Selected PDF',controller. previewSelectedPdf.value),
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

