import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teaching_with_purpose/app/data/models/class_schedule_model.dart';
import 'package:teaching_with_purpose/app/data/models/exam_sheet_model.dart';
import 'package:teaching_with_purpose/app/data/models/time_table_model.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class ScheduleController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxString formattedDate = ''.obs;
  Rx<ExamSheetModel> examsheetmodel = ExamSheetModel().obs;
  RxBool isLoding = false.obs;
  Rx<ClassScheduleModel> classSchedule = ClassScheduleModel().obs;
  final RxList<TimeTableModel> mondayTable = <TimeTableModel>[].obs;
  final RxList<TimeTableModel> tuesdayTable = <TimeTableModel>[].obs;
  final RxList<TimeTableModel> wednesdayTable = <TimeTableModel>[].obs;
  final RxList<TimeTableModel> thursdayTable = <TimeTableModel>[].obs;
  final RxList<TimeTableModel> fridayTable = <TimeTableModel>[].obs;

  @override
  void onInit() {
    teacherClassSchedule();
    super.onInit();
  }

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
    formattedDate.value = DateFormat('dd MMMM yyyy (EEEE)').format(date);
  }

  //-----------------------Class Schedule-------------------------------

  Future<void> teacherClassSchedule() async {
    isLoding(true);
    try {
      final responce = await APIManager.getClassSchedule();

      if (responce.data['status'] == true) {
        clearTimetableLists();

        classSchedule.value = ClassScheduleModel.fromJson(responce.data);

        for (final element in classSchedule.value.data!) {
          for (final data in element!.timeTable!) {
            switch (data!.day!.toLowerCase()) {
              case 'monday':
                mondayTable.add(data);
                break;
              case 'tuesday':
                tuesdayTable.add(data);
                break;
              case 'wednesday':
                wednesdayTable.add(data);
                break;
              case 'thursday':
                thursdayTable.add(data);
                break;
              case 'friday':
                fridayTable.add(data);
                break;
            }
          }
        }
        await examSheet();
      } else {
        Utils.showMySnackbar(desc: 'Something went wrong');
      }
    } catch (e) {
      log('Error: $e');
    } finally {
      isLoding(false);
    }
  }

  void clearTimetableLists() {
    mondayTable.clear();
    tuesdayTable.clear();
    wednesdayTable.clear();
    thursdayTable.clear();
    fridayTable.clear();
  }

  //-----------------------Exam sheet-------------------------------

  Future<void> examSheet() async {
    isLoding(true);
    try {
      final responce = await APIManager.getExamSheet();
      if (responce.data['status'] == true) {
        // log('examSheet...${responce.data}');
        examsheetmodel.value = ExamSheetModel.fromJson(responce.data);
      } else {
        Utils.showMySnackbar(desc: 'something went wrong');
      }
    } catch (e) {
      log('error..$e');
    } finally {
      isLoding(false);
    }
  }
}
