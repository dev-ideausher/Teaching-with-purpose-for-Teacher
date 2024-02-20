import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/modules/live_quizz/controllers/live_quizz_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class LiveQuizzSucessView extends GetView<LiveQuizzController>{
    const LiveQuizzSucessView({Key? key}) : super(key: key);
    @override
      Widget build(BuildContext context){
      return Scaffold(
        appBar:PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Live Quiz',isBack: true)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37,vertical: 52),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300.kh,
                width: 300.kw,
                child: Lottie.asset(
                    'assets/lottiefiles/sucess.json'),
              ),
              8.kheightBox,
              Text(
                  'Created Successfully !',
                  style: TextStyleUtil.kText24_6(fontWeight: FontWeight.w600)),
              8.kheightBox,
              Text(
                  'Live quiz created successfully !',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w400, color: Get.context!.kNeutral)),
              189.kheightBox,
              TButton(title: 'Go To Homepage', onTap: ()=> Get.offNamed(Routes.BOTTOM_NAV)),
            ],
          ),
        ),
      ),
    );
    }



}