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
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.context!.kWhite,
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  textAlign: TextAlign.center,
                  'Change Password',
                  style: TextStyleUtil.kText32_6(fontWeight: FontWeight.w600)),
              Text(
                  textAlign: TextAlign.center,
                  'Enter new password',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w400, color: Get.context!.kNeutral)),
              92.kheightBox,
              CustomTextField(
                  hint: StringConstants.enterNewPassword,
                  controller: controller.newPassword,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => !isValidPassword(value, isRequired: true)
                      ? 'Please enter a valid  Password'
                      : null,
                  suffixIcon: const Icon(Icons.visibility_off)),
              24.kheightBox,
              CustomTextField(
                  hint: StringConstants.reEnterNewPassword,
                  controller: controller.reEnterPassword,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => !isValidPassword(value, isRequired: true)
                      ? 'Please enter a valid  Password'
                      : null,
                  suffixIcon: const Icon(Icons.visibility_off)),
              184.kheightBox,
              SizedBox(
                  width: 343.kw,
                  height: 56.kh,
                  child: TButton(
                      title: StringConstants.continueText, onTap: ()=> Get.toNamed(Routes.CHANGE_PASS_SUCESS))),
            ],
          ),
        ),
      ),
    );
  }



  // platform depent icon
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
