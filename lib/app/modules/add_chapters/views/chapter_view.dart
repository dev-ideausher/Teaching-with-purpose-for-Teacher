
import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/commom_loader.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/data/models/class_model.dart';
import 'package:teaching_with_purpose/app/modules/add_chapters/controllers/add_chapters_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class ChapterView extends GetView<AddChaptersController>{
  const ChapterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    final controller = Get.put(AddChaptersController());
    String selectedSubjectName = controller.subjectName;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: selectedSubjectName, isBack: true)),
      body: Obx(() => controller.isLoding.value?
      const Loader():
        SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              Center(child: dropDawn()),
              32.kheightBox,
              ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => 16.kheightBox, 
              itemCount: controller.chapters.value.data?.length?? 0,
              itemBuilder: (context, index) {
              final chapterData = controller.chapters.value.data?[index];
              final videoCount = chapterData?.video != null ? 1 : 0;
              final pdfCount = chapterData?.uploadPdf != null ? 1 : 0;
              final totalAttachments = videoCount + pdfCount;
                return chapterWidget(
                  chapterName: chapterData?.chapterName?? '',
                  conceptName: chapterData?.concept?? '',
                  dec: '${chapterData?.desc?? ''} ....',
                  text: '$totalAttachments Attachment${totalAttachments != 1 ? 's' : ''}',
                );
              },),
            ],
          ),
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        elevation: 0,
        onPressed: ()=>Get.toNamed(Routes.ADD_CHAPTERS),
        backgroundColor: context.kPrimary,
        child: Icon(Icons.add, color: context.kWhite),
      ),
    );
  }



// dropdawn widget

  Widget dropDawn() {
    return Obx(() => Container(
          decoration: BoxDecoration(
          color: Get.context!.kLightBlue,
          borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<ClassModelData?>(
              isExpanded: true,
              hint: Text('Select Class',
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              items: controller.subjectsController.classItems
                  .map((ClassModelData? item) =>
                      DropdownMenuItem<ClassModelData?>(
                        value: item,
                        child: Text(item?.className ?? '',
                            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),)).toList(),
                onChanged: (ClassModelData? value) {
                Future.delayed(Duration.zero, () {
                  controller.subjectsController.selectedClass.value = value?.className ?? '';
                log('${value?.className}');
                });
              },
            ),
          ),
        ));
  }

//
  Widget chapterWidget(
  {required String chapterName,required String conceptName, required String dec, required String text}) {
    return SizedBox(
      height: 211.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Chapter Name',
                  style: TextStyleUtil.kText14_4(
                      fontWeight: FontWeight.w400,
                      color: Get.context!.kLightTextColor),
                ),
                const Spacer(),
                Icon(Icons.edit, color: Get.context!.kPrimary, size: 20),
                Icon(
                  Icons.delete_outline_outlined,
                  size: 20,
                  color: Get.context!.kPrimary,
                )
              ],
            ),
            Text(
              chapterName,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
            ),
            8.kheightBox,
            Text(
              'Concept Name',
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400,
                  color: Get.context!.kLightTextColor),
            ),
            Text(
              conceptName,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
            ),
            8.kheightBox,
            Text(
              'Concept Description',
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400,
                  color: Get.context!.kLightTextColor),
            ),
            Expanded(
              child: Text(
                dec,
                maxLines: 1,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
            ),
            8.kheightBox,
            Text(
              text,
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400, color: Get.context!.kPrimary),
            ),
          ],
        ),
      ),
    );
  }
}