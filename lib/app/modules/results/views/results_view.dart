import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../../../data/models/class_model.dart';
import '../../../data/models/subjects_list_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/results_controller.dart';

class ResultsView extends GetView<ResultsController> {
  const ResultsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Results',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Class',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              buildClassDropdawn(),
              16.kheightBox,
              Text(
                'Subject',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              buildSubjectDropdawn(),
              32.kheightBox,
              ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder:(context, index) => 8.kheightBox,
              itemCount: Get.find<HomeController>().studentsmodel.value.data?.length?? 0,
              itemBuilder: (context, index) {
                return WidgetConstants.buildStudentCard(
                image: Get.find<HomeController>().studentsmodel.value.data?[index]?.image == null?
                       Assets.images.studImg1.image(height: 40.kh,width: 40.kw,fit: BoxFit.cover):
                       CachedNetworkImage(imageUrl:Get.find<HomeController>().studentsmodel.value.data?[index]?.image?? ''),
                name: Get.find<HomeController>().studentsmodel.value.data?[index]?.name?? '',
                rollNber: 'Roll No. ${Get.find<HomeController>().studentsmodel.value.data?[index]?.rollNumber?? ''}',
                onTap: (){
                  final data = Get.find<HomeController>().studentsmodel.value.data?[index];
                  Get.toNamed(Routes.ADD_RESULTS, arguments: data);
                }
                );
              },
              )
            ],
          ),
        ),
      ),
    );
  }

Widget buildClassDropdawn() {
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Get.context!.kWhite,
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
                            style: TextStyleUtil.kText16_5(
                                fontWeight: FontWeight.w400)),
                      ))
                  .toList(),
              onChanged: (ClassModelData? value) {
                controller.selectClass(value);
              },
            ),
          ),
        ));
  }

Widget buildSubjectDropdawn() {
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<SubjectsListModelData?>(
              isExpanded: true,
              hint: Text('Select Subject',
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              items: controller.subjectsController.subjectItems
                  .map((SubjectsListModelData? item) =>
                      DropdownMenuItem<SubjectsListModelData?>(
                        value: item,
                        child: Text(item?.subject ?? '',
                            style: TextStyleUtil.kText16_5(
                                fontWeight: FontWeight.w400)),
                      ))
                  .toList(),
              value: controller.subjectsController.selectedSubject.value == ''
                  ? null
                  : controller.subjectsController.subjectItems.firstWhere(
                      (SubjectsListModelData? item) =>
                          item?.subject ==
                          controller.subjectsController.selectedSubject.value),
              onChanged: (SubjectsListModelData? value) {
                controller.selectSubject(value);
              },
            ),
          ),
        ));
  }

}
