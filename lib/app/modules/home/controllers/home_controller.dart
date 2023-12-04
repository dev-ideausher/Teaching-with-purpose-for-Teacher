import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

class HomeController extends GetxController {

  TextEditingController searchController = TextEditingController();

  RxBool isClockIn = true.obs;
  RxString timerText = 'Work Duration: 00:00:00'.obs;
  Rx<DateTime> startTime = DateTime.now().obs;
  Timer? timer;

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
}
