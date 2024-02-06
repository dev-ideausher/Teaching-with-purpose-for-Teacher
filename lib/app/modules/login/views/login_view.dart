import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/app/utils/validation.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formkey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 92),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Login',
                  style: TextStyleUtil.kText32_6(fontWeight: FontWeight.w600),
                ),
                Text(
                    textAlign: TextAlign.center,
                    'Enter your login details',
                    style: TextStyleUtil.kText16_5(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kNeutral)),
                52.kheightBox,
                CustomTextField(
                    hint: StringConstants.emailText,
                    controller: controller.emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) => !isValidEmail(value, isRequired: true)
                        ? 'Please enter a valid  Email'
                        : null),
                16.kheightBox,
                Obx(
                  () => CustomTextField(
                      hint: StringConstants.passwordText,
                      controller: controller.passwordController,
                      textInputType: TextInputType.emailAddress,
                      // validator: (value) =>
                      //     !isValidPassword(value, isRequired: true)
                      //         ? 'Please enter a valid  Password'
                      //         : null,
                      isObscure: !controller.isPassVisible.value,
                      onChanged: (value) => controller.password.value,
                      suffixIcon: InkWell(
                          onTap: () => controller.isPassVisible.value =
                              !controller.isPassVisible.value,
                          child: Icon(
                              controller.isPassVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined,
                              color: context.kNotActive))),
                ),
                16.kheightBox,
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Forgot Password ?',
                        style: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.kNeutral),
                      ),
                    ),
                  ],
                ),
                43.kheightBox,
              SizedBox(
                  width: 343.kw,
                  height: 56.kh,
                  child: TButton(
                      title: StringConstants.login,
                      onTap: () => controller.checkLogin()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

