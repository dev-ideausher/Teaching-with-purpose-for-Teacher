import 'package:get/get.dart';

class ResultsController extends GetxController {
  var selectedSubject = 'Mathematics'.obs;
  var selectedValue = 'Class 8-A'.obs;
  RxBool isLoding = false.obs;

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
}
