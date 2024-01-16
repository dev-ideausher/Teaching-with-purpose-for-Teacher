
import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/teacher_details_model.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/services/storage.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class ProfileController extends GetxController {

 RxBool isLoding = false.obs;
 Rx<TeacherDetailsModel> teachermodel = TeacherDetailsModel().obs;


  @override
  void onInit() {
  getUser();
    super.onInit();
  }

 //-----------------------Get user-------------------------------
 
Future<void> getUser()async{
  isLoding(true);
  try {
    var responce = await APIManager.getuser(id: Get.find<GetStorageService>().id);
    if(responce.statusCode == 200){
      
    // log('teacherdetails...${jsonEncode(responce.data)}');
    teachermodel.value = TeacherDetailsModel.fromJson(responce.data);
    }
  } catch (e) {
    log('***$e');
  }finally{
    isLoding(false);
  }
}

//-----------------------App Rating-------------------------------

  Future<void> giveRating(String rating) async {
    try {
      var body = {"rating": rating};

      final responce = await APIManager.giveRating(body: body);

      if (responce.data['status'] == true) {

        //log('rating...${responce.data}');

        Utils.showMySnackbar(title: 'Rating Submitted',desc:'Thankyou for the Rating' );

      } else {
        Utils.showMySnackbar(desc: 'An error occured!');
      }
    } catch (e) {
      log('*.error..$e');
    }
  }




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
