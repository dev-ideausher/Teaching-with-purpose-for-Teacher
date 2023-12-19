import 'package:get/get.dart';

class SubjectsController extends GetxController {
  var selectedValue = 'Class 8-A'.obs;

//... list of  class  for dropdawn
  final List<String> items = [
    'Class 8-A',
    'Class 8-B',
    'Class 9-D',
    'Class 10-A',
    'Class 10-C',
  ];

  void selectClass(String item) {
    selectedValue.value = item;
  }

 //-----------------------List Chapter -------------------------------
}
