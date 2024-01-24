import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teaching_with_purpose/app/data/models/class_schedule_model.dart';
import 'package:teaching_with_purpose/app/data/models/exam_sheet_model.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class ScheduleController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxString formattedDate = ''.obs;
  Rx<ExamSheetModel> examsheetmodel= ExamSheetModel().obs;
  RxBool isLoding = false.obs;
  RxList<ClassScheduleModel> scheduleList = <ClassScheduleModel>[].obs;


 @override
  void onInit() {
  examSheet();
    super.onInit();
  }

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
    formattedDate.value = DateFormat('dd MMMM yyyy (EEEE)').format(date);
  }




  //-----------------------Exam sheet-------------------------------
  
  Future<void> examSheet()async{
    isLoding(true);
    try {
      final responce = await APIManager.getExamSheet();
      if (responce.data['status'] == true) {
        // log('examSheet...${responce.data}');
      examsheetmodel.value = ExamSheetModel.fromJson(responce.data);
      }else{
        Utils.showMySnackbar(desc: 'something went wrong');
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }

  //-----------------------Class Schedule-------------------------------

  Future<void> classSchedule() async {
    isLoding(true);
    try {
      final responce = await APIManager.getClassSchedule();

      if (responce.data['status'] == true) {
        final List<dynamic> scheduleDataList = responce.data['data'];

        scheduleList.value = scheduleDataList
            .map((data) => ClassScheduleModel.fromJson(data))
            .toList();

        //await examSheet();
      } else {
        Utils.showMySnackbar(desc: 'Something went wrong');
      }
    } catch (e) {
      log('Error: $e');
    } finally {
      isLoding(false);
    }
  }
}
