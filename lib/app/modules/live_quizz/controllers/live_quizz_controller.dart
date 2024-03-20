
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:teaching_with_purpose/app/data/models/class_model.dart';
import 'package:teaching_with_purpose/app/data/models/quizz_question_model.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
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
  var quizzDurationController = TextEditingController();
  RxList<QuizQuestion> quizQuestions = <QuizQuestion>[].obs;

  RxBool isLoading = false.obs;
  RxString selectedDate = ''.obs;
  final homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialize();
    });
  }

  void initialize() {
    homeController.updateSubjectItems();
    homeController.updateClassItems();
  }

  void selectSubject(SubjectsListModelData? value) {
    if (value != null) {
      homeController.selectedSubject.value = value.subject ?? '';
      homeController.selectedSubjectId.value = value.Id ?? '';
      log('Selected Subject ID: ${homeController.selectedSubjectId.value}');
    }
  }

  void selectClass(ClassModelData? value) {
    if (value != null) {
      homeController.selectedClass.value = "${value.className}-${value.section}";
      homeController.selectedClassId.value = value.Id ?? '';
      log('Selected Class ID: ${homeController.selectedClassId.value}');
    }
  }

  void chooseDate(BuildContext context) async {
    DateTime? selectedDateValue;
    await showDialog(
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 450.kh,
            width: double.infinity,
            child: SfDateRangePicker(
              selectionColor: context.kPrimary,
              selectionMode: DateRangePickerSelectionMode.single,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                selectedDateValue = args.value;
                if (selectedDateValue != null) {
                  Get.back();
                }
              },
              minDate: DateTime.now(),
              maxDate: DateTime.now().add(const Duration(days: 30)),
            ),
          ),
        );
      },
    );

    if (selectedDateValue != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      selectedDate.value = formatter.format(selectedDateValue!);
      dateAndTimeController.value.text = selectedDate.value;
    }
  }

  //-----------------------Add-Quizz-------------------------------

  void addNewQuizz() {
    String newQuestionText = questionsController.text;
    List<String> options = [
      option1Controller.text,
      option2Controller.text,
      option3Controller.text,
      option4Controller.text,
    ];

    int correctAnswer = int.tryParse(answerController.text) ?? 0;
    if (correctAnswer < 1 || correctAnswer > 4) {
      Utils.showMySnackbar(desc: 'Please enter a valid option number (1-4) for the correct answer');
      return;
    }

    int marks = int.tryParse(markController.text) ?? 0;
    if (marks <= 0) {
      Utils.showMySnackbar(desc: 'Please enter a valid positive value for marks');
      return;
    }

    QuizQuestion newQuestion = QuizQuestion(
      questionText: newQuestionText,
      options: options,
      answer: correctAnswer,
      points: marks,
    );

    quizQuestions.addAll([newQuestion]);

    questionsController.clear();
    option1Controller.clear();
    option2Controller.clear();
    option3Controller.clear();
    option4Controller.clear();
    answerController.clear();
    markController.clear();
  }

  Future<void> createQuiz() async {
    try {
      if (quizQuestions.isEmpty) {
        Utils.showMySnackbar(desc: 'Please fill all the fields');
        return;
      }

      var body = {
        "subject": homeController.selectedSubjectId.value,
        "class": homeController.selectedClassId.value,
        "date": dateAndTimeController.value.text,
        "instructions": instructionsController.text,
        "question": quizQuestions.map((question) => question.toJson()).toList()
      };

      log('$body');

      final response = await APIManager.createQuiz(body: body);
      if (response.data['status'] == true) {
        log('response: ${response.data}');
        Get.toNamed(Routes.LIVE_QUIZZ_SUCESS);
      } else {
        Utils.showMySnackbar(desc: 'Error while adding quiz');
      }
    } catch (error) {
      log('error: $error');
      Utils.showMySnackbar(desc: 'An error occurred. Please try again later.');
    }
  }

  @override
  void onClose() {
    dateAndTimeController.value.dispose();
    questionsController.dispose();
    instructionsController.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
    option3Controller.dispose();
    option4Controller.dispose();
    answerController.dispose();
    markController.dispose();
    quizzDurationController.dispose();
    super.onClose();
  }
}

// [
//         {
//           "questionText": questionsController.text,
//           "answer": int.parse(answerController.text),
//           "points": int.parse(markController.text),
//           "options": [
//             option1Controller.text,
//             option2Controller.text,
//             option3Controller.text,
//             option4Controller.text
//           ]
//         },
//       ]