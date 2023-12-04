
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/constants/image_constant.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';

class SplashController extends GetxController {
  String bgImg = ImageConstant.backgroungImg;
  String splash = ImageConstant.splashImg;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.ON_BOARD);
    });
    super.onInit();
  }
}
