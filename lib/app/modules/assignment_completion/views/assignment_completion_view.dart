import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';

import '../controllers/assignment_completion_controller.dart';

class AssignmentCompletionView extends GetView<AssignmentCompletionController> {
  const AssignmentCompletionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Assignment Completion',isBack: true)),
      body: const Center(
        child: Text(
          'AssignmentCompletionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
