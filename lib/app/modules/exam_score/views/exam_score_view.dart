import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';

import '../controllers/exam_score_controller.dart';

class ExamScoreView extends GetView<ExamScoreController> {
  const ExamScoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Exam Score',isBack: true)),
      body: const Center(
        child: Text(
          'ExamScoreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
