import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';

import '../controllers/add_assignment_feedback_controller.dart';

class AddAssignmentFeedbackView
    extends GetView<AddAssignmentFeedbackController> {
  const AddAssignmentFeedbackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Assignment', isBack: true)),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
