import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';

import '../controllers/course_completion_controller.dart';

class CourseCompletionView extends GetView<CourseCompletionController> {
  const CourseCompletionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Course Completion',isBack: true)),
      body: const Center(
        child: Text(
          'CourseCompletionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
