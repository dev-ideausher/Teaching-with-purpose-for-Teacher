import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var isPassVisible = false.obs;

  var password = ''.obs;

  final formkey = GlobalKey<FormState>();
  

  late AnimationController animationController;
  
  late Animation animation;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

// safegard  fuction
  void checkLogin() {
    if (!formkey.currentState!.validate()) {
      return;
    }
    Get.offNamed(Routes.BOTTOM_NAV);
  }
}
