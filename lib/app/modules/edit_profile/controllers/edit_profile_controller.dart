import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'as route;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:intl/intl.dart';
import 'package:teaching_with_purpose/app/data/models/file_upload_model.dart';
import 'package:teaching_with_purpose/app/data/models/teacher_details_upload_model.dart';
import 'package:teaching_with_purpose/app/modules/profile/controllers/profile_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/services/storage.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';


class EditProfileController extends GetxController {
  var  nameController = TextEditingController();
  var  emailController = TextEditingController();
  var  genderController = TextEditingController();
  var  ageCOntroller = TextEditingController();

  RxString pickedImagePath = ''.obs;
  RxString selectedDate = ''.obs;
  Rx<FileUploadModel> fileUpload = FileUploadModel().obs;
  Rx<TeacherDetailsUploadModel> updateTeacher = TeacherDetailsUploadModel().obs;

 @override
  void onInit() {
  nameController.value = TextEditingValue(text: Get.find<ProfileController>().teachermodel.value.data?.first?.name?? '');
  emailController.value = TextEditingValue(text: Get.find<ProfileController>().teachermodel.value.data?.first?.email?? '');
  genderController.value = TextEditingValue(text: Get.find<ProfileController>().teachermodel.value.data?.first?.gender?? '');
  ageCOntroller.value = const TextEditingValue(text: '30');
    super.onInit();
  }


  Future<void>onClick()async{
    if(pickedImagePath.isNotEmpty){
      await uploadImage();
    }else{
      Utils.showMySnackbar(desc: 'Choose a profile image');
    }
  }



  //-----------------------Upload File-------------------------------

    Future<void> uploadImage() async {
    final File pickedImageFile = File(pickedImagePath.value);
    
    String extension = path.extension(pickedImageFile.path).replaceAll(".", "");

    final body = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        pickedImageFile.path,
        contentType: MediaType('application', extension),
        filename: path.basename(pickedImageFile.path),
      )});
    try {
       final responce = await APIManager.fileUpload(body: body);

       if(responce.data['status'] == true){

        fileUpload.value =  FileUploadModel.fromJson(responce.data);

        log('fileupload....${fileUpload.value.url}');
        updateUser();
       }
    } catch (e) {
      log("$e");
    } 
  }

 //-----------------------update Profile-------------------------------

  Future<void> updateUser() async {  

  var body = {
    "Image": fileUpload.value.url
  };

  log('$body');
  log(Get.find<GetStorageService>().id.toString());

    try {
      final responce = await APIManager.updateUser( body: body, id: Get.find<GetStorageService>().id);

      if (responce.statusCode == 200) {

      // updateTeacher.value = TeacherDetailsUploadModel.fromJson(responce.data);

      log('teacher..${responce.data}');

      Utils.showMySnackbar( desc: 'Profile updated Successfully');

      await Get.find<ProfileController>().getUser();

      Get.toNamed(Routes.BOTTOM_NAV);

      }else{
        
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
      log('***$e');
    }
  }


  //-----------------------Image from gallery-------------------------------

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      pickedImagePath.value = image!.path;
      log("pickedImage path ${pickedImagePath.value}");
    } catch (e) {
      throw Exception(e);
    }
  }

  //-----------------------Date Picker -------------------------------
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
      ageCOntroller.text = selectedDate.value;
    }
  }

  @override
  void onClose() {
  nameController.dispose();
  emailController.dispose();
  genderController.dispose();
  ageCOntroller.dispose();
    super.onClose();
  }
}
