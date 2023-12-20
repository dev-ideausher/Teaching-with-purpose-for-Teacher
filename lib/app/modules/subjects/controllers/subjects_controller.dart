import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';

class SubjectsController extends GetxController {
  RxBool isLoding = false.obs;
  Rx<SubjectsListModel> subjectLists= SubjectsListModel().obs;

    @override
  void onInit() {
    getSubjects();
    super.onInit();
  }


 //-----------------------List Subjects -------------------------------
  Future<void> getSubjects()async{
    isLoding(true);
    try {
      final responce = await APIManager.getSubjects();
      if (responce.statusCode == 200) {
        // log('subjects...${responce.data}');
        subjectLists.value = SubjectsListModel.fromJson(responce.data);
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }


}
