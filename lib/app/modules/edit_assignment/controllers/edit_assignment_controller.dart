import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as route;
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:teaching_with_purpose/app/data/models/assignment_model.dart';
import 'package:teaching_with_purpose/app/data/models/file_upload_model.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

import '../../assignments/controllers/assignments_controller.dart';

class EditAssignmentController extends GetxController {
  var titleController = TextEditingController();
  var decriptionController = TextEditingController();
  var dateController = TextEditingController().obs;
  var markController = TextEditingController();
  Rx<AssignmentModel> assignmentModel = AssignmentModel().obs;
  Rx<FileUploadModel> fileUpload = FileUploadModel().obs;
  RxString selectedFile = ''.obs;
  RxString selectedDate = ''.obs;


   @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  void getArguments() {
    assignmentModel.value = route.Get.arguments;
    titleController.value = TextEditingValue(text: assignmentModel.value.title ?? '');
    decriptionController.value = TextEditingValue(text: assignmentModel.value.desc ?? '');
    markController.value = TextEditingValue(text: assignmentModel.value.totalMarks ?? '');
  }

  Future<String?> pickFile() async {
    List<String> filePath =
        await Utils.pickMultipleFilesWithFilter(['pdf', 'jpg', 'jpeg', 'png']);
    if (filePath.isNotEmpty) {
      String addedFilePath = filePath.first;
      log('Selected  file path: $addedFilePath');
      selectedFile.value = addedFilePath;
      await uploadFile(addedFilePath);
    }
    return null;
  }

//-----------------------File upload-------------------------------

  Future<void> uploadFile(String filePath) async {
    final File pickedFile = File(filePath);
    final extension =
        path.extension(pickedFile.path).replaceAll(".", "").trim();

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
      } else {
        Utils.showMySnackbar(desc: 'File upload failed. Please try again.');
      }
    } catch (e) {
      log("e......$e");
    }
  }
//-----------------------Update Assignment-------------------------------

Future<void> updateAssignment() async {


    String? url = '';

    if (selectedFile.value.isNotEmpty) {
      await uploadFile(selectedFile.value);
      url = fileUpload.value.url;
    }

    var body = {
      "subject": '',
      "class": "",
      "title": titleController.text,
      "desc":decriptionController.text,
      "totalMarks": markController.text,
      "dueDate": dateController.value,
      "uploadFile": url
    };

    try {

      final responce = await APIManager.updateAssignment(id: '', body: body);

      if (responce.data['status'] == true) {

        Utils.showMySnackbar(desc: responce.data['message']);

        await route.Get.find<AssignmentsController>().assignedAssignments();

      } else {
        Utils.showMySnackbar(desc: 'Cant update assignment ');
      }
    } catch (e) {
      log('error...$e');
    }
  }

  //-----------------------Choose Date-------------------------------
  void chooseDate(BuildContext context) async {
    DateTime? selectedDateValue;
    await showDialog(
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 450.kh,
            width: double.infinity,
            child: SfDateRangePicker(
              selectionColor: context.kPrimary,
              selectionMode: DateRangePickerSelectionMode.single,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                selectedDateValue = args.value;
                if (selectedDateValue != null) {
                  route.Get.back();
                }
              },
              minDate: DateTime.now(),
              maxDate: DateTime.now().add(const Duration(days: 30)),
            ),
          ),
        );
      },
    );

    if (selectedDateValue != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      selectedDate.value = formatter.format(selectedDateValue!);
      dateController.value.text = selectedDate.value;
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    decriptionController.dispose();
    dateController.value.dispose();
    markController.dispose();
    selectedFile.close();
    fileUpload.close();
    super.onClose();
  }
}
