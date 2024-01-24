import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

import '../controllers/add_assignment_controller.dart';

class AddAssignmentView extends GetView<AddAssignmentController> {
  const AddAssignmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Assignment', isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 39),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assignment Title',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ), 
            16.kheightBox,
              CustomTextField(
                hint: 'Enter Title',
                controller: controller.titleController,
              ),
            16.kheightBox,
               Text(
                'Enter Description',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
            16.kheightBox,
              CustomTextField(
                hint: 'Enter Description',
                controller: controller.decriptionController,
                minLine: 6,
                maxLines: 8,
              ),
              16.kheightBox,
              Text(
                'Due Date',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
            16.kheightBox,
           Obx(() => CustomTextField(
                hint: 'Select Due Date',
                controller: controller.dateController.value,
                onTap: () => controller.chooseDate(context),
                suffixIcon: Icon(
                  Icons.calendar_month_outlined,
                  color: context.kPrimary,
                ),
              )),
          16.kheightBox,
              Text(
                'Total Marks',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              16.kheightBox,
              CustomTextField(
                hint: 'Enter Total Marks',
                controller: controller.markController,
              ),
            40.kheightBox,
            buildAddButton(
              text: 'Upload File',
                  onTap: () async{controller.pickFile();}),
            Obx(() =>Visibility(
              visible: controller.addedFile.value.isNotEmpty,
              replacement: const SizedBox.shrink(),
                 child: Text(
                  controller.addedFile.value,
                  style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                   ),
               ),),
          32.kheightBox, 
                SizedBox(
                    width: 343.kw,
                    height: 56.kh,
                    child: TButton(title: StringConstants.save, onTap: ()=> controller.addAssignment()))         
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
