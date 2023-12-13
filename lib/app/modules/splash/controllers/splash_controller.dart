
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/constants/image_constant.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dependency_injection.dart';
import 'package:teaching_with_purpose/app/services/storage.dart';

class SplashController extends GetxController {
  String bgImg = ImageConstant.backgroungImg;
  String splash = ImageConstant.splashImg;

  @override
  void onInit() {
    DependencyInjection.init();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Get.find<GetStorageService>().isLoggedIn==true ? Routes.BOTTOM_NAV: Routes.ON_BOARD);
    });
    super.onInit();
  }
}
