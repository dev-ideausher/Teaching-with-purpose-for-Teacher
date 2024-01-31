import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';

import '../../gen/assets.gen.dart';
import '../components/custom_richtext.dart';
import '../services/text_style_util.dart';

class WidgetConstants{

static   Widget buildStudentCard({required Widget image, required String name, required String rollNber, required void Function() onTap}){
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 65.kh,
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
                  Text(name, style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                  ),
                  4.kheightBox,
                  Text( rollNber,style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor),
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

 static Widget resultCard({required String type, required String topic, required String mark}){
  return SizedBox(
      height: 90.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.svg.editPencil.svg(height: 24.kh, width: 24.kw),
            16.kwidthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                  ),
                  4.kheightBox,
                  Text(
                    topic,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor),
                  ),
                  4.kheightBox,
                  ReUsableRichText(
                      text1: 'Marks obtained: ',
                      text2: mark,
                      style1:TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                      style2: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
                ],
              ),
            ),
          103.kwidthBox,
          Assets.svg.chapter.svg(height: 24.kh,width: 24.kw)
          ],
        ),
      ),
    );
 }
  

  static   Widget profileSectionWidget(SvgGenImage image, String title, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 57.kh,
        width: 343.kw,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Get.context!.kWhite),
        child: Row(
          children: [
            image.svg(),
            16.kwidthBox,
            Text(
                title,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
            const Spacer(),
             const Icon(Icons.arrow_forward_ios,size: 15)
          ],
        ),
      ),
    );
  }


static Widget assignedWidget(
{required String assignment, required String dueDate, void Function()? onTap,void Function()? onEdit,void Function()? onDelete}){
  return  InkWell(
    onTap: onTap,
    child: SizedBox(
            height: 69.kh,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Row(
                children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(
                      assignment,
                      maxLines: 1,
                      style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)) ,
                    4.kheightBox,
                     Text(
                      'duedate:$dueDate',
                      maxLines: 1,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)) ,
                    ],
                  ),
                ),
                111.kwidthBox,
                GestureDetector(
                  onTap:onEdit ,
                  child: Assets.svg.editPencil.svg(height: 20.kh,width: 20.kw)),
                8.kwidthBox,
                GestureDetector(
                  onTap: onDelete,
                  child: Assets.svg.delete.svg(height: 20.kh,width: 20.kw))
                ],
              ),
            ),
           ),
  );
}
}




