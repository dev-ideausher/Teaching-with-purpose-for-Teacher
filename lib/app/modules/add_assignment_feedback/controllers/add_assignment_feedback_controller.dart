import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAssignmentFeedbackController extends GetxController {
 var areaOfImprovementController = TextEditingController();
 var rivewsController = TextEditingController();


  



 //-----------------------Assignment-Feedback-------------------------------
 


 

 @override
  void onClose() {
    areaOfImprovementController.dispose();
    rivewsController.dispose();
    super.onClose();
  }
}
