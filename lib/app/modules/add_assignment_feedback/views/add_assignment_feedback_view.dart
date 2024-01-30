import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_assignment_feedback_controller.dart';

class AddAssignmentFeedbackView
    extends GetView<AddAssignmentFeedbackController> {
  const AddAssignmentFeedbackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddAssignmentFeedbackView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddAssignmentFeedbackView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
