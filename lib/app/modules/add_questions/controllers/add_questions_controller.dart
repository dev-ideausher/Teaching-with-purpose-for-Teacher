import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class AddQuestionsController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabController;
  var selectedTabIndex = 0.obs;
  RxBool isLoding = false.obs;
  String subjectName = '';
  String chapterId = '';
  var questionController = TextEditingController();
  var solutionController = TextEditingController();
  var options1 = TextEditingController();
  var options2 = TextEditingController();
  var options3 = TextEditingController();
  var options4 = TextEditingController();
  var reviseQuestionController = TextEditingController();
  var reviseSolutionController = TextEditingController();
  var reviseOptions1 = TextEditingController();
  var reviseOptions2 = TextEditingController();
  var reviseOptions3 = TextEditingController();
  var reviseOptions4 = TextEditingController();
   
  @override
  void onInit() {
    intinilize();
    super.onInit();
  }


  void intinilize(){
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => selectedTabIndex.value = tabController.index);
    final Map<String, dynamic> arguments = Get.arguments;
    subjectName = arguments['subjectName'];
     chapterId = arguments['chapterId'];
  }
  

//-----------------------Add Question-------------------------------
  Future<void> addQuestions() async {
    if(questionController.text.isEmpty || solutionController.text.isEmpty || options1.text.isEmpty ||
       options2.text.isEmpty || options3.text.isEmpty || options4.text.isEmpty){
      Utils.showMySnackbar(desc: 'Please fill all the fields');
      return;
    }
    
    var body = {
      "chapterId": chapterId,
      "question": [
        {
          "questionText": questionController.text,
          "options": [options1.text, options2.text, options3.text, options4.text],
          "solution":solutionController.text
        }
      ],
    };
    
    try {
      final responce = await APIManager.createQuestion(body: body);

      if (responce.data['status'] == true) {

        log('question responce...${responce.data}');

        Utils.showMySnackbar(desc: 'Question added sucessfully');
        
        Get.offAllNamed(Routes.BOTTOM_NAV);
      } else {
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
      log('questionError..$e');
    }
  }
//-----------------------Add-revise-Questions-------------------------------

  Future<void> addReviseQuestions() async {
    if(reviseQuestionController.text.isEmpty || reviseSolutionController.text.isEmpty || reviseOptions1.text.isEmpty ||
       reviseOptions2.text.isEmpty || reviseOptions3.text.isEmpty || reviseOptions4.text.isEmpty){
      Utils.showMySnackbar(desc: 'Please fill all the fields');
      return;
    }
    
    var body = {
      "chapterId": chapterId,
      "question": [
        {
          "questionText": reviseQuestionController.text,
          "options": [reviseOptions1.text, reviseOptions2.text, reviseOptions3.text, reviseOptions4.text],
          "solution":reviseSolutionController.text
        }
      ],
    };

    try {
      final responce = await APIManager.addReviseQuestions(body: body);

      //log('$body');

      if (responce.data['status'] == true) {

        log('question responce...${responce.data}');

        Utils.showMySnackbar(desc: 'ReviseQuestion added sucessfully');
        
        Get.offAllNamed(Routes.BOTTOM_NAV);
      } else {
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
      log('questionError..$e');
    }
  
}

@override
  void onClose() {
  questionController.dispose();
  solutionController.dispose();
  options1.dispose();
  options2.dispose();
  options3.dispose();
  options4.dispose();
  reviseQuestionController.dispose();
  reviseSolutionController.dispose();
  reviseOptions1.dispose();
  reviseOptions2.dispose();
  reviseOptions3.dispose();
  reviseOptions4.dispose();
  super.onClose();
  }

}