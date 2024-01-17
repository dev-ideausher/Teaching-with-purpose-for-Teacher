import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/class_model.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class SubjectsController extends GetxController {
  RxBool isLoding = false.obs;
  Rx<SubjectsListModel> subjectLists= SubjectsListModel().obs;
  Rx<ClassModel> classModel = ClassModel().obs;

  RxList<SubjectsListModelData?> subjectItems = <SubjectsListModelData?>[].obs;
  RxList<ClassModelData?> classItems = <ClassModelData?>[].obs;

  RxString selectedSubject = 'English'.obs;
  RxString selectedClass = '8-A'.obs;

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
        await getClasses();
      }else{
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }

//-----------------------Get Class List-------------------------------

  Future<void> getClasses()async{
    isLoding(true);
    try {
      final responce = await APIManager.getClasses();
      if (responce.statusCode == 200) {
        // log('classes...${responce.data}');
        classModel.value = ClassModel.fromJson(responce.data);
      }else{
      Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }

void updateSubjectItems() {
  subjectItems.assignAll(subjectLists.value.data ?? []);
}

  void updateClassItems() {
    classItems.assignAll(classModel.value.data ?? []);
  }
 
}
