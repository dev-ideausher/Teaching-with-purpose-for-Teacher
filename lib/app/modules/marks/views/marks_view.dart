import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/marks_controller.dart';

class MarksView extends GetView<MarksController> {
  const MarksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MarksView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MarksView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
