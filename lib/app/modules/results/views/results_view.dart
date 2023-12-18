import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../controllers/results_controller.dart';

class ResultsView extends GetView<ResultsController> {
  const ResultsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Results',isBack: true)),
      body: Obx(() => controller.isLoding.value?
      Center(child: CircularProgressIndicator(color: context.kPrimary)):
      SingleChildScrollView(
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
              SizedBox(
                height: 622.kh,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                 separatorBuilder:(context, index) => 8.kheightBox,
                 itemCount: controller.studentsmodel.value.data?.length?? 0,
                itemBuilder: (context, index) {
                  return buildStudentCard(
                  image: controller.studentsmodel.value.data?[index]?.image == null?
                   Assets.images.studImg1.image(height: 40.kh,width: 40.kw,fit: BoxFit.cover):
                   CachedNetworkImage(imageUrl:controller.studentsmodel.value.data?[index]?.image?? ''),
                  name: controller.studentsmodel.value.data?[index]?.name?? 'Esther Howard',
                  rollNber: controller.studentsmodel.value.data?[index]?.rollNumber.toString()?? '',
                  onTap: (){}
                  );
                },
                ),
              )
            ],
          ),
        ),
      ),
      )
    );
  }

  Widget buildClassDropdawn(){
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select Classes',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,
                    color: Get.context!.kLightTextColor),
              ),
              items: controller.classes
                  .map((String item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              value: controller.selectedValue.value,
              onChanged: (String? value) => controller.selectClass(value!),
            ),
          ),
        ));
  }

  Widget buildSubjectDropdawn(){
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select Subject',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,
                    color: Get.context!.kLightTextColor),
              ),
              items: controller.items
                  .map((String item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              value: controller.selectedSubject.value,
              onChanged: (String? value) => controller.selectSubject(value!),
            ),
          ),
        ));
  }

  Widget buildStudentCard({required Widget image, required String name, required String rollNber, required void Function() onTap}){
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 62.kh,
        width: 343.kw,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Row(
            children: [
           ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: image,
           ),
           12.kwidthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                  ),
                  4.kheightBox,
                  Text(
                    rollNber,
                    style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kLightTextColor),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios,size: 15)
            ],
          ),
        ),
      ),
    );
  }
}
