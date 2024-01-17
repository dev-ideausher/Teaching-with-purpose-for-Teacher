import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teaching_with_purpose/app/data/models/announcement_model.dart';
import 'package:teaching_with_purpose/app/data/models/events_model.dart';
import 'package:teaching_with_purpose/app/data/models/students_model.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

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

  
// event items to list
  List<String> eventsTitile = [
    'Sports Day',
    'Annual Day',
    'Parent-Teacher Meeting',
  ];
  List<String> time = ['Friday, 3:00 pm', 'Friday, 3:00 pm', 'Friday, 3:00 pm'];
  List<String> detailsText = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ];
  List<Image> eventImages = [
    Assets.images.sportsImg.image(),
    Assets.images.sportsImg.image(),
    Assets.images.sportsImg.image(),
  ];

//functon forthe clock in the home page 
  void toggleClock() {
    if (isClockIn.value) {
      isClockIn.value = false;
      startTime.value = DateTime.now();
      timer = Timer.periodic(const Duration(seconds: 0), (_) {
        final duration = DateTime.now().difference(startTime.value);
        final formattedDuration = _formatDuration(duration);
        timerText.value = 'Work Duration: $formattedDuration';
      });
    } else {
      isClockIn.value = true;
      timer?.cancel();
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.remainder(24).toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }


String formatTimestamp(String timestamp) {
  // Parse the timestamp
  DateTime dateTime = DateTime.parse(timestamp);

  // Format the time
  String formattedTime = DateFormat('HH:mm').format(dateTime);

  return formattedTime;
}

//-----------------------Announcements-------------------------------

   Future<void> showAnnouncements()async{
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
    }finally{
      isLoding(false);
    }
  }

 
 //-----------------------Events-------------------------------

  Future<void> showEvents()async{
    isLoding(true);
    try {
      final responce = await APIManager.getEvents();
      if (responce.statusCode == 200) {
        // log('events...${responce.data}');
        eventModel .value = EventsModel.fromJson(responce.data);
        await listAllStudents();
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }

//-----------------------Students list -------------------------------

  Future<void> listAllStudents()async{
    isLoding(true);
  try {
    final responce = await APIManager.getAllStudent();
    if(responce.statusCode == 200){

      studentsmodel.value = StudentsModel.fromJson(responce.data);

      //log('studentslist..${responce.data}');
    } else{

      Utils.showMySnackbar(desc: responce.data['message']);
    }
  } catch (error) {
    log('error...$error');
  }finally{
    isLoding(false);
  }

  }

}
