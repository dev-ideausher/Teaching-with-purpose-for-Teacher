import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';

import '../controllers/student_behavior_controller.dart';

class StudentBehaviorView extends GetView<StudentBehaviorController> {
  const StudentBehaviorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Student Behavior',isBack: true)),
      body: const Center(
        child: Text(
          'StudentBehaviorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
