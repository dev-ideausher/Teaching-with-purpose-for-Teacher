import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose/app/modules/profile/controllers/profile_controller.dart';
import 'package:teaching_with_purpose/app/modules/schedule/controllers/schedule_controller.dart';

import '../controllers/bottom_nav_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(
      () => BottomNavController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<ScheduleController>(
       ScheduleController(),
       permanent: true,
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
