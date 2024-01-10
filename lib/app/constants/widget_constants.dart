import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';

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


  
}