
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:teaching_with_purpose/app/data/models/class_model.dart';
import 'package:teaching_with_purpose/app/data/models/quizz_question_model.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class LiveQuizzController extends GetxController {
  var dateAndTimeController = TextEditingController().obs;
  var quizdurationController  = TextEditingController().obs;
  var instructionsController = TextEditingController();
  var questionsController = TextEditingController();
  var option1Controller = TextEditingController();
  var option2Controller = TextEditingController();
  var option3Controller = TextEditingController();
  var option4Controller = TextEditingController();
  var answerController = TextEditingController();
  var markController = TextEditingController();
  List<QuizQuestion> quizQuestions = [];


  RxBool isLoding = false.obs;
  RxString selectedDate = ''.obs;
  final subjectsController = Get.find<SubjectsController>();

 @override
  void onInit() {
  super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     initilize();
  });
  }

  void initilize(){
  subjectsController.updateSubjectItems();
  subjectsController.updateClassItems();
  }

  void selectSubject(SubjectsListModelData? value) {
    if (value != null) {
      subjectsController.selectedSubject.value = value.subject ?? '';
      subjectsController.selectedSubjectId.value = value.Id ?? '';
      log('Selected Subject ID:.... ${subjectsController.selectedSubjectId.value}');
    }
  }

  void selectClass(ClassModelData? value) {
    if (value != null) {
      subjectsController.selectedClass.value = "${value.className}-${value.section}";
      subjectsController.selectedClassId.value = value.Id ?? '';
      log('Selected Class ID:.... ${subjectsController.selectedClassId.value}');
    }
  }

  //-----------------------Date Picker-------------------------------
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

 //-----------------------Add-new-quizz-------------------------------
  void addNewQuestion() {
  String newQuestionText = questionsController.text;
  List<String> options = [
    option1Controller.text,
    option2Controller.text,
    option3Controller.text,
    option4Controller.text,
  ];
  int correctAnswerIndex = int.tryParse(answerController.text) ?? 0;
  int marks = int.tryParse(markController.text) ?? 0;

  QuizQuestion newQuestion = QuizQuestion(
    questionText: newQuestionText,
    options: options,
    correctAnswerIndex: correctAnswerIndex,
    marks: marks,
  );

  quizQuestions.add(newQuestion);

    questionsController.clear();
    option1Controller.clear();
    option2Controller.clear();
    option3Controller.clear();
    option4Controller.clear();
    answerController.clear();
    markController.clear();
  }

//  String? selectedClass = Get.find<SubjectsController>().selectedClass.value;
//  String? selectedSub = Get.find<SubjectsController>().selectedSubject.value;

//-----------------------create Quiz-------------------------------

  Future<void> createQuiz() async {
    if (dateAndTimeController.value.text.isEmpty ||instructionsController.value.text.isEmpty ||
        quizdurationController.value.text.isEmpty ||quizQuestions.isEmpty) {
      Utils.showMySnackbar(desc: 'Please fill all the fields and add questions');
      return;
    }

    var body = {
      "subject": subjectsController.selectedSubjectId.value,
      "class": subjectsController.selectedClassId.value,
      "date": dateAndTimeController.value.text,
      "instructions": instructionsController.text,
      "question": quizQuestions.map((question) => question.toJson()).toList(),
    };

    try {
      final responce = await APIManager.createQuiz(body: body);
      if (responce.data['status'] == true) {
        log('responce ...${responce.data}');
        Get.toNamed(Routes.LIVE_QUIZZ_SUCESS);
      } else {
        Utils.showMySnackbar(desc: 'Error while adding quizz');
      }
    } catch (error) {
      log('error....$error');
    }
  }

  @override
  void onClose() {
    dateAndTimeController.value.dispose();
    questionsController.dispose();
    instructionsController.dispose();
    questionsController.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
    option3Controller.dispose();
    option4Controller.dispose();
    answerController.dispose();
    markController.dispose();
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