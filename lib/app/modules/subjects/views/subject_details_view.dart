import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class SubjectsDetailsScreen extends GetView<SubjectsController> {
  const SubjectsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Mathematics', isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              Center(child: dropDawn()),
              32.kheightBox,
              chapterWidget(
                  chapterName: 'Relations and Functions I',
                  conceptName: 'Ordered Pairs',
                  dec: 'Lorem ipsum dolor sit amet, consectetur ....',
                  text: '1 Attachment'),
              16.kheightBox,
              chapterWidget(
                  chapterName: 'Relations and Functions I',
                  conceptName: 'Ordered Pairs',
                  dec: 'Lorem ipsum dolor sit amet, consectetur ....',
                  text: '1 Attachment'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_SUBJECTS);
        },
        backgroundColor: context.kPrimary,
        child: Icon(Icons.add, color: context.kWhite),
      ),
    );
  }


// dropdawn widget

  Widget dropDawn() {
    return ColoredBox(
        color: Get.context!.kLightBlue,
        child: Obx(
          () => DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select class',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
              ),
              items: controller.items
                  .map((String item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              value: controller.selectedValue.value,
              onChanged: (String? value) => controller.selectClass(value!),
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 40.kh,
                width: 140.kw,
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 40.kh,
              ),
            ),
          ),
        ));
  }

//
  Widget chapterWidget({required String chapterName,required String conceptName, required String dec, required String text}) {
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
                Icon(Icons.edit, color: Get.context!.kPrimary, size: 15),
                Icon(
                  Icons.delete_outline_outlined,
                  size: 15,
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
            Text(
              dec,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
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
