import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:lottie/lottie.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordSuccessView extends GetView<ChangePasswordController> {
  const ChangePasswordSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 96),
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
                  textAlign: TextAlign.center,
                  'Password Changed !',
                  style: TextStyleUtil.kText24_6(fontWeight: FontWeight.w600)),
              8.kheightBox,
              Text(
                  textAlign: TextAlign.center,
                  'Password changed successfully !',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w400, color: Get.context!.kNeutral)),
              85.kheightBox,
              SizedBox(
                  width: 343.kw,
                  height: 56.kh,
                  child: TButton(title: StringConstants.login, onTap: ()=> Get.offNamed(Routes.LOGIN))),
            ],
          ),
        ),
      ),
    );
  }
}