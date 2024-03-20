import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/data/models/chapter_questions_model.dart';
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
  var options1Controller = TextEditingController();
  var options2Controller = TextEditingController();
  var options3Controller = TextEditingController();
  var options4Controller = TextEditingController();
  var reviseQuestionController = TextEditingController();
  var reviseSolutionController = TextEditingController();
  var reviseOptions1 = TextEditingController();
  var reviseOptions2 = TextEditingController();
  var reviseOptions3 = TextEditingController();
  var reviseOptions4 = TextEditingController();
  RxList<ChapterQuestion> questions = <ChapterQuestion>[].obs;

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

void addMoreQuestions() {
    String questionText = questionController.text;
    String solution = solutionController.text;
    List<String> options = [
      options1Controller.text,
      options2Controller.text,
      options3Controller.text,
      options4Controller.text,
    ];

    ChapterQuestion newQuestion = ChapterQuestion(
      questionText: questionText,
      options: options,
      solution: solution,
    );

    questions.addAll([newQuestion]);

    questionController.clear();
    solutionController.clear();
    options1Controller.clear();
    options2Controller.clear();
    options3Controller.clear();
    options4Controller.clear();
  }
  
  Future<void> addQuestions() async {
    if (questions.isEmpty) {
      Utils.showMySnackbar(desc: 'Please add questions');
      return;
    }

    var body = {
      "chapterId": chapterId,
      "question": questions.map((question) => question.toJson()).toList(),
    };

    try {
      final responce = await APIManager.createQuestion(body: body);
      //log('*****$body');
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
//-----------------------Revise-Question-------------------------------
void addMoreReviseQuestions() {
    String questionText = reviseQuestionController.text;
    String solution = reviseSolutionController.text;
    List<String> options = [
      reviseOptions1.text,
      reviseOptions2.text,
      reviseOptions3.text,
      reviseOptions4.text,
    ];

    ChapterQuestion newQuestion = ChapterQuestion(
      questionText: questionText,
      options: options,
      solution: solution,
    );

    questions.addAll([newQuestion]);

    reviseQuestionController.clear();
    reviseSolutionController.clear();
    reviseOptions1.clear();
    reviseOptions2.clear();
    reviseOptions3.clear();
    reviseOptions4.clear();
  }

  Future<void> addReviseQuestions() async {
    if (questions.isEmpty) {
      Utils.showMySnackbar(desc: 'Please add questions');
      return;
    }
    
    var body = {
      "chapterId": chapterId,
      "question": questions.map((question) => question.toJson()).toList()
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
      log('reviceQuestionError..$e');
    }
}

@override
  void onClose() {
  questionController.dispose();
  solutionController.dispose();
  options1Controller.dispose();
  options2Controller.dispose();
  options3Controller.dispose();
  options4Controller.dispose();
  reviseQuestionController.dispose();
  reviseSolutionController.dispose();
  reviseOptions1.dispose();
  reviseOptions2.dispose();
  reviseOptions3.dispose();
  reviseOptions4.dispose();
  super.onClose();
  }
}

















// [
//         {
//           "questionText": questionController.text,
//           "options": [options1.text, options2.text, options3.text, options4.text],
//           "solution":solutionController.text
//         }
//       ],

// [
//         {
//           "questionText": reviseQuestionController.text,
//           "options": [reviseOptions1.text, reviseOptions2.text, reviseOptions3.text, reviseOptions4.text],
//           "solution":reviseSolutionController.text
//         }
//       ],