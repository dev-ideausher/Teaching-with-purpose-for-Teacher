import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/teacher_details_model.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/services/storage.dart';

class ProfileController extends GetxController {

 RxBool isLoding = false.obs;
 Rx<TeacherDetailsModel> teachermodel = TeacherDetailsModel().obs;


  @override
  void onInit() {
  getTeacher();
    super.onInit();
  }

 //-----------------------Get Teacher details-------------------------------
 
Future<void> getTeacher()async{
  isLoding(true);
  try {
    var responce = await APIManager.getTeacherDetail(id: Get.find<GetStorageService>().id);
    if(responce.statusCode == 200){
      
    log('teacherdetails...${jsonEncode(responce.data)}');
    teachermodel.value = TeacherDetailsModel.fromJson(responce.data);
    }
  } catch (e) {
    log('***$e');
  }finally{
    isLoding(false);
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
