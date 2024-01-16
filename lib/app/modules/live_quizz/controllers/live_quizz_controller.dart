
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class LiveQuizzController extends GetxController {
  var dateAndTimeController = TextEditingController().obs;
  var instructionsController = TextEditingController();
  var questionsController = TextEditingController();
  var option1Controller = TextEditingController();
  var option2Controller = TextEditingController();
  var option3Controller = TextEditingController();
  var option4Controller = TextEditingController();
  var answerController = TextEditingController();
  var markController = TextEditingController();


  RxBool isLoding = false.obs;
  RxString selectedDate = ''.obs;

  final subjectsController = Get.find<SubjectsController>();

 @override
  void onInit() {
  subjectsController.updateSubjectItems();
  subjectsController.updateClassItems();
    super.onInit();
  }

//-----------------------Date Picker-------------------------------

  void chooseDate(BuildContext context) async {
    final datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now(),
    );
    if (datePicker == null) {
      return;
    } else {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      selectedDate.value = formatter.format(datePicker);
      dateAndTimeController.value.text = selectedDate.value;
    }
  }

//-----------------------create Quiz-------------------------------

  Future<void> createQuiz() async {
    if (dateAndTimeController.value.text.isEmpty || instructionsController.value.text.isEmpty ||
        questionsController.value.text.isEmpty ||  option1Controller.value.text.isEmpty ||
        option2Controller.value.text.isEmpty ||option3Controller.value.text.isEmpty ||
        option4Controller.value.text.isEmpty || answerController.text.isEmpty || markController.text.isEmpty) {
      Utils.showMySnackbar(desc: 'Please fill all the fields');
      return;
    }

    var body = {
      "subject": "english",
      "class": "8-A",
      "date": dateAndTimeController.value.text,
      "instructions": instructionsController.text,
      "question": [
        {
          "questionText": questionsController.text,
          "answer": answerController.text,
          "points": markController.text,
          "options": [
            option1Controller.text,
            option2Controller.text,
            option3Controller.text,
            option4Controller.text
          ]
        },
      ]
    };

    // var body = {
    //   "subject": "english",
    //   "class": "8-A",
    //   "date": "2023-11-23",
    //   "instructions": "Read the questions carefully.",
    //   "question": [
    //     {
    //       "questionText": "What is 2 + 2?",
    //       "answer": 4,
    //       "points": 5,
    //       "options": ["3", "4", "5", "6"]
    //     }
    //   ]
    // };

    try {
      final responce = await APIManager.createQuiz(body: body);
      if (responce.data['status'] == true) {
        log('responce ...${responce.data}');

        Get.toNamed(Routes.LIVE_QUIZZ_SUCESS);

      } else {
        Utils.showMySnackbar(title: '${responce.statusCode}', desc: 'Error while adding quizz');
      }
    } catch (error) {
      log('error....$error');
      // Utils.showMySnackbar(desc: 'Error: $error');
    
    }
  }


  @override
  void onClose() {
    super.onClose();
    dateAndTimeController.value.dispose();
    instructionsController.dispose();
    questionsController.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
    option3Controller.dispose();
    option4Controller.dispose();
    answerController.dispose();
    markController.dispose();
  }
}
