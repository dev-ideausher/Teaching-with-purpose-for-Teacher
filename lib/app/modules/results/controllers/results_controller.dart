
import 'dart:developer';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/students_model.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class ResultsController extends GetxController {
  var selectedSubject = 'Mathematics'.obs;
  var selectedValue = 'Class 8-A'.obs;
  RxBool isLoding = false.obs;

  Rx<StudentsModel> studentsmodel = StudentsModel().obs;


 @override
  void onInit() {
    listAllStudents();
    super.onInit();
  }
//... list of  subject  for dropdawn
  final List<String> items = [
    'Mathematics',
    'English',
  ];

// ..........function for  subject dropDawn
  void selectSubject(String item) {
    selectedSubject.value = item;
  }

//... list of  class  for dropdawn
  final List<String> classes = [
    'Class 8-A',
    'Class 8-B',
    'Class 9-D',
    'Class 10-A',
    'Class 10-C',
  ];

  void selectClass(String item) {
    selectedValue.value = item;
  }

//-----------------------Students list -------------------------------

  Future<void> listAllStudents()async{
    isLoding(true);
  try {
    final responce = await APIManager.getAllStudent();
    if(responce.statusCode == 200){
      studentsmodel.value = StudentsModel.fromJson(responce.data);
      log('studentslist..${responce.data}');
    }else{
      Utils.showMySnackbar(desc: responce.data['message']);
    }
  } catch (error) {
    log('error...$error');
  }finally{
    isLoding(false);
  }

  }
}
