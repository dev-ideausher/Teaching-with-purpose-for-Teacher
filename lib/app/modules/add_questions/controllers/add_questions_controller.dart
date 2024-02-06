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

  RxString previewQuestion = ''.obs;
  RxString previewOptions1 = ''.obs;
  RxString previewOptions2 = ''.obs;
  RxString previewOptions3 = ''.obs;
  RxString previewOptions4 = ''.obs;
  RxString previewSolution = ''.obs;

  RxBool isPreviewing = false.obs;
   
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
  
  void togglePreviewMode() {
    isPreviewing.toggle();
    if (isPreviewing.isTrue) {
      previewQuestion.value = questionController.text;
      previewOptions1.value = options1.text;
      previewOptions2.value = options2.text;
      previewOptions3.value = options3.text;
      previewOptions4.value = options4.text;
      previewSolution.value = solutionController.text;
    }
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
          "answer": solutionController.text,
          "options": [options1.text, options2.text, options3, options4],
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
          "questionText": "What is the capital of France?",
          "answer": 2,
          "options": ["London", "Paris", "Berlin", "Madrid"],
          "solution": "The capital of France is Paris."
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

}