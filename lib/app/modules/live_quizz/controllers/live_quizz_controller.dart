import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class LiveQuizzController extends GetxController {
  var dateAndTimeController = TextEditingController().obs;
  var instructionsController = TextEditingController().obs;
  var questionsController = TextEditingController().obs;
  var option1Controller = TextEditingController().obs;
  var option2Controller = TextEditingController().obs;
  var option3Controller = TextEditingController().obs;
  var option4Controller = TextEditingController().obs;

  var selectedSubject = 'Mathematics'.obs;
  var selectedValue = 'Class 8-A'.obs;
  RxBool isLoding = false.obs;
  RxString selectedDate = ''.obs;

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
    if (dateAndTimeController.value.text.isEmpty ||
        instructionsController.value.text.isEmpty ||
        questionsController.value.text.isEmpty ||
        option1Controller.value.text.isEmpty ||
        option2Controller.value.text.isEmpty ||
        option3Controller.value.text.isEmpty ||
        option4Controller.value.text.isEmpty) {
      Utils.showMySnackbar(desc: 'Please fill all the fields');
      return;
    }

//  var  quizData = {
//   "subject": selectedSubject.value.toString(),
//   "class": selectedValue.value.toString(),
//   "date": dateAndTimeController.value.text,
//   "instructions": instructionsController.value.text,
//   "question": [
//     {
//       "questionText": questionsController.value.text,
//       "answer": 4,
//       "points": 5,
//       "options": [
//         option1Controller.value.text,
//         option2Controller.value.text,
//         option3Controller.value.text,
//         option4Controller.value.text
//       ]
//     },
//   ]
// };

    var body = {
      "subject": "english",
      "class": "8-A",
      "date": "2023-11-23",
      "instructions": "Read the questions carefully.",
      "question": [
        {
          "questionText": "What is 2 + 2?",
          "answer": 4,
          "points": 5,
          "options": ["3", "4", "5", "6"]
        }
      ]
    };

    isLoding(true);
    try {
      final responce = await APIManager.createQuiz(body: body);
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        log('responce ...${responce.data}');
        Get.toNamed(Routes.LIVE_QUIZZ_SUCESS);
      } else {
        Utils.showMySnackbar(title: '${responce.statusCode}', desc: 'Error while adding quizz');
      }
    } catch (error) {
      log('error....$error');
      Utils.showMySnackbar(desc: 'Error: $error');
    } finally {
      isLoding(false);
    }
  }


  @override
  void onClose() {
    super.onClose();
    dateAndTimeController.value.dispose();
    instructionsController.value.dispose();
    questionsController.value.dispose();
    option1Controller.value.dispose();
    option2Controller.value.dispose();
    option3Controller.value.dispose();
    option4Controller.value.dispose();
  }
}
