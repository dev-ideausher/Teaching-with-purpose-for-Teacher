import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
      children: [
        Image.asset(controller.bgImg,fit: BoxFit.cover,height: double.maxFinite,width: double.infinity),
        Center(
          child: Image.asset(controller.splash,width: 343.kw,height: 115.kh),
        )
      ],
     ),
    );
  }
}
