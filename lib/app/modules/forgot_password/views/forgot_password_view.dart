import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/app/utils/validation.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Get.context!.kWhite,
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  textAlign: TextAlign.center,
                  'Forgot Password',
                  style: TextStyleUtil.kText32_6(fontWeight: FontWeight.w600)),
              Text(
                  textAlign: TextAlign.center,
                  'Enter registered E-mail ID',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w400, color: Get.context!.kNeutral)),
              92.kheightBox,
              Text(
                  textAlign: TextAlign.center,
                  'We will send a verification code to your registered E-mail Id',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w400, color: Get.context!.kNeutral)),
              40.kheightBox,
              CustomTextField(
                  hint: StringConstants.emailText,
                  controller: controller.forgotPasswordController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => !isValidEmail(value, isRequired: true)
                      ? 'Please enter a valid  Email': null),
              184.kheightBox,
              SizedBox(
                width: 343.kw,
                height: 56.kh,
                child:TButton(title: StringConstants.continueText,onTap: () => Get.toNamed(Routes.VERIFY)),
              ),
            ],
          ),
        ),
      ),
    );
  }



 // platform independent appbar with icon
    appBarWidget() {
    IconData iconData =
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;
    return AppBar(
      elevation: 0,
      backgroundColor: Get.context!.kWhite,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(iconData, color: Get.context!.kPrimary),
      ),
    );
  }
}
