import 'package:get/get.dart';

class ScheduleController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
  }
}
