import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';

import '../../gen/assets.gen.dart';
import '../components/custom_richtext.dart';
import '../services/text_style_util.dart';

class WidgetConstants{

static  Widget buildStudentCard(
  {required Widget image, required String name, required String rollNber, required void Function() onTap}){
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

static Widget customLogoutDialog({required BuildContext context,required VoidCallback onNoPressed,required VoidCallback onLogoutPressed}) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: Container(
        height: 198.kh,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.context!.kWhite,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Confirm Logout',
                  style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              8.kheightBox,
              Text(
                'Are you sure you want to logout?',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,
                    color: Get.context!.kLightTextColor),
              ),
              32.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onNoPressed,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Get.context!.kPrimary),
                      ),
                      child: Center(
                        child: Text(
                          'No',
                          style: TextStyleUtil.kText16_5(
                              fontWeight: FontWeight.w500,
                              color: Get.context!.kPrimary),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onLogoutPressed,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Get.context!.kRed),
                      ),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyleUtil.kText16_5(
                              fontWeight: FontWeight.w500,
                              color: Get.context!.kRed),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

 static rowWidget(String title, String subtitle, void Function() onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
        149.kwidthBox,
        InkWell(
          onTap: onTap,
          child: Text(
            subtitle,
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400, color: Get.context!.kPrimary)),
        )
      ],
    );
  }


  static Widget studentAssignmentCard({
    required Widget image, required String name, required String rollNber, required void Function() onTap}){
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
              Assets.svg.eye.svg(height: 24.kh,width: 24.kw),
              8.kwidthBox,
              Assets.svg.download.svg(height: 24.kh,width: 24.kw)
            ],
          ),
        ),
      ),
    );
  }

  static Widget assignmentRowWidget({required void Function() onTap, required void Function() onDawnload}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 81),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              InkWell(onTap: onTap, child: Assets.svg.eye.svg(height: 20.kh,width: 20.kw)),
              6.kwidthBox,
              Text(
                'View Assignment',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                color: Get.context!.kLightTextColor,
                )),
            ],
          ),
          12.kheightBox,
          Row(
            children: [
              InkWell(onTap: onDawnload, child: Assets.svg.download.svg(height: 20.kh,width: 20.kw)),
              6.kwidthBox,
              Text(
                'Download Assignment',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                color: Get.context!.kLightTextColor
              )),
            ],
          ),
        ],
      ),
    );
  }

static Widget studentSection({required Widget image,required String name, required String rolNumber, required String submitedOn}){
  return SizedBox(
    height: 94.kh,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Row(
             children: [
             ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: image,
             ),
             16.kwidthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name, 
                      style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                    ),
                    6.kheightBox,
                    ReUsableRichText(
                      text1: 'Roll No. : ', 
                      text2: rolNumber, 
                      style1: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                      style2: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                              color: Get.context!.kLightTextColor), 
                    ),
                    6.kheightBox,
                    ReUsableRichText(
                      text1: 'Submitted on ', 
                      text2: submitedOn, 
                      style1: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                      style2: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,
                              color: Get.context!.kLightTextColor), 
                    ),
                  ],
                ),
              ],
            ),
          )
        );
       }

  static Widget subjectViewHorizontal({required String subject,void Function()? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
            height: 56.kh,
            width: 343.kw,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 40.kh,
                        width: 40.kw,
                        child: Center(
                          child: Assets.svg.mathsSmall.svg(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Assets.images.grupedEllipseSmall.image(),
                      )
                    ],
                  ),
                  16.kwidthBox,
                  Text(
                    subject,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
    );
  }
}



