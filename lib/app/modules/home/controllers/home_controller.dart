import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teaching_with_purpose/app/data/models/announcement_model.dart';
import 'package:teaching_with_purpose/app/data/models/class_model.dart';
import 'package:teaching_with_purpose/app/data/models/events_model.dart';
import 'package:teaching_with_purpose/app/data/models/students_model.dart';
import 'package:teaching_with_purpose/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    showAnnouncements();
    super.onInit();
  }

  RxBool isClockIn = true.obs;
  RxString timerText = 'Work Duration: 00:00:00'.obs;
  Rx<DateTime> startTime = DateTime.now().obs;
  Timer? timer;
  RxBool isLoding = false.obs;

  Rx<EventsModel> eventModel = EventsModel().obs;
  Rx<AnnouncementModel> announcement = AnnouncementModel().obs;
  Rx<StudentsModel> studentsmodel = StudentsModel().obs;
  Rx<SubjectsListModel> subjectLists= SubjectsListModel().obs;
  Rx<ClassModel> classModel = ClassModel().obs;
  RxList<SubjectsListModelData?> subjectItems = <SubjectsListModelData?>[].obs;
  RxList<ClassModelData?> classItems = <ClassModelData?>[].obs;
  RxString selectedSubject = 'English'.obs;
  RxString selectedClass = '8'.obs;
  RxString selectedSubjectId = ''.obs;
  RxString selectedClassId = ''.obs;


  List<String> time = ['Friday, 3:00 pm', 'Friday, 3:00 pm', 'Friday, 3:00 pm'];


//functon for the clock in the home page
  void toggleClock() {
    if (isClockIn.value) {
      isClockIn.value = false;
      startTime.value = DateTime.now();
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        final duration = DateTime.now().difference(startTime.value);
        final formattedDuration = _formatDuration(duration);
        timerText.value = 'Work Duration: $formattedDuration';
      });
    } else {
      isClockIn.value = true;
      timer?.cancel();
      markAttendence();
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.remainder(24).toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

 //-----------------------Time -formact -------------------------------

  String formatTimestamp(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedTime = DateFormat('HH:mm').format(dateTime);
    return formattedTime;
  }

  //-----------------------Mark-Attendence-------------------------------

  Future<void> markAttendence() async {
    final duration = DateTime.now().difference(startTime.value).inSeconds;

    final body = {
      "duration": duration.toString(), 
      "isPresent": true
    };

    try {
      isLoding(true);
      final responce = await APIManager.markAttendence(body: body);
      if (responce.data['status'] == true) {
        log('attendence marked....${responce.data}');

        Utils.showMySnackbar(desc: 'Attendnce marked');
      } else {
        Utils.showMySnackbar(desc: 'Error occured');
      }
    } catch (e) {
      log('error..*$e');
    } finally {
      isLoding(false);
    }
  }

//-----------------------Announcements-------------------------------

  Future<void> showAnnouncements() async {
    isLoding(true);
    try {
      final responce = await APIManager.getAnnouncements();
      if (responce.statusCode == 200) {
        // log('announcements...${responce.data}');
        announcement.value = AnnouncementModel.fromJson(responce.data);
        await showEvents();
      }
    } catch (e) {
      log('error..$e');
    } finally {
      isLoding(false);
    }
  }

  //-----------------------Events-------------------------------

  Future<void> showEvents() async {
    isLoding(true);
    try {
      final responce = await APIManager.getEvents();
      if (responce.statusCode == 200) {
        // log('events...${responce.data}');
        eventModel.value = EventsModel.fromJson(responce.data);
        await listAllStudents();
      }
    } catch (e) {
      log('error..$e');
    } finally {
      isLoding(false);
    }
  }

//-----------------------Students list -------------------------------

  Future<void> listAllStudents() async {
    isLoding(true);
    try {
      final responce = await APIManager.getAllStudent();
      if (responce.statusCode == 200) {
        studentsmodel.value = StudentsModel.fromJson(responce.data);
        //log('studentslist..${responce.data}');
        await getSubjects();
      } else {
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (error) {
      log('error...$error');
    } finally {
      isLoding(false);
    }
  }

 //-----------------------List Subjects -------------------------------

  Future<void> getSubjects()async{
    isLoding(true);
    try {
      final responce = await APIManager.getSubjects();
      if (responce.statusCode == 200) {
         log('subjects...${responce.data}');
        subjectLists.value = SubjectsListModel.fromJson(responce.data);
        await getClasses();
      }else{
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }

//-----------------------Get Class List-------------------------------

  Future<void> getClasses()async{
    isLoding(true);
    try {
      final responce = await APIManager.getClasses();
      if (responce.statusCode == 200) {
         //log('classes...${responce.data}');
        classModel.value = ClassModel.fromJson(responce.data);
      }else{
      Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }

  void updateSubjectItems() {
    subjectItems.assignAll(subjectLists.value.data ?? []);
  }

  void updateClassItems() {
    classItems.assignAll(classModel.value.data ?? []);
  }

}
 