import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/storage.dart';

class ProfileController extends GetxController {
 RxBool isLoding = false.obs;



//-----------------------logout-------------------------------
  logout() async {
    try {
      Get.find<GetStorageService>().logout();
      await Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      e.toString();
    }
  }
}
