import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'as route;
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:teaching_with_purpose/app/data/models/file_upload_model.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';


class AddAssignmentController extends GetxController {
 var titleController = TextEditingController();
 var decriptionController = TextEditingController();
 var dateController = TextEditingController().obs;
 var markController = TextEditingController();
 RxString addedFile = ''.obs;
 RxString selectedDate = ''.obs;
 Rx<FileUploadModel> fileUpload = FileUploadModel().obs;




Future<String?> pickFile() async {
  List<String> filePath = await Utils.pickMultipleFilesWithFilter(['pdf','jpg', 'jpeg', 'png']);
  if (filePath.isNotEmpty) {
    String addedFilePath = filePath.first;
    log('Selected  file path: $addedFilePath');
    addedFile.value = addedFilePath;
    await uploadFile(addedFilePath);
  }
  return null;
}


//-----------------------File upload-------------------------------

  Future<void> uploadFile(String filePath) async {
    final File pickedFile = File(filePath);
    final extension = path.extension(pickedFile.path).replaceAll(".", "").trim();

    final body = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        pickedFile.path,
        contentType: MediaType('application', extension),
        filename: path.basename(pickedFile.path),
      ),
    });

    try {
      final response = await APIManager.fileUpload(body: body);
      if (response.data['status'] == true) {
        log('fileresponce...${response.data}');
        fileUpload.value = FileUploadModel.fromJson(response.data);
        Utils.showMySnackbar(desc: 'File sucessfully added '); 
      }else{
       Utils.showMySnackbar(desc: 'File upload failed. Please try again.'); 
      }
    } catch (e) {
      log("e......$e");
    }
  }


//-----------------------Add Assignment -------------------------------

Future<void> addAssignment()async{
 if(titleController.text.isEmpty || decriptionController.text.isEmpty || dateController.value.text.isEmpty||
    markController.text.isEmpty){
  Utils.showMySnackbar(desc: 'Please fill all the fields');
  return;
 }
  String? selectedSub = route. Get.find<SubjectsController>().selectedSubject.value;

  try {
    String? url = '';

   if(addedFile.value.isNotEmpty){
    await uploadFile(addedFile.value);
    url = fileUpload.value.url;
   }

      var body = {
        "subject": selectedSub,
        "class": "8-A",
        "title": titleController.text,
        "desc": decriptionController.text,
        "totalMarks": markController.text,
        "dueDate": selectedDate.value.toString(),
        "uploadFile": url
      };

    final response = await APIManager.createAssignment(body: body);
    if (response.data['status'] == true) {
      log('assignment response...${response.data}');

      Utils.showMySnackbar(desc: 'Assignment created successfully');
      route.Get.toNamed(Routes.BOTTOM_NAV);
    } else {
      Utils.showMySnackbar(desc: response.data['message']);
    }
  } catch (e) {
    log('error..$e');
  }
}


  void chooseDate(BuildContext context) async {
    final datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now(),
    );
    if (datePicker == null) {
      return;
    } else {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      selectedDate.value = formatter.format(datePicker);
      dateController.value.text = selectedDate.value;
    }
  }

@override
void onClose() {
  titleController.dispose();
  decriptionController.dispose();
  dateController.value.dispose();
  markController.dispose();
  addedFile.close(); 
  fileUpload.close();
  super.onClose();
}
}
