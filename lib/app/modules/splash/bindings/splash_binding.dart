import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/services/global_services.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
      Get.lazyPut<GlobalData>(
          () => GlobalData(),
    );
  }
}
