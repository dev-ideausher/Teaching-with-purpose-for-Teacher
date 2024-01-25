import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'as route;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:teaching_with_purpose/app/data/models/chapter_model.dart';
import 'package:teaching_with_purpose/app/data/models/chapters_list_model.dart';
import 'package:teaching_with_purpose/app/data/models/file_upload_model.dart';
import 'package:teaching_with_purpose/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose/app/services/global_services.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';

class AddChaptersController extends GetxController {
  RxBool isLoding = false.obs;
  RxString selectedFile = ''.obs;
  RxString selectedPdf = ''.obs;
  String subjectName = '';
  String subjectId = '';
  var chapterNameController = TextEditingController();
  var topicNameController = TextEditingController();
  var topicDescriptionController = TextEditingController();
  Rx<FileUploadModel> fileUpload = FileUploadModel().obs;
  Rx<ChaptersModel> chapters = ChaptersModel().obs;

  final subjectsController = Get.find<SubjectsController>();

  RxString previewChapterName = ''.obs;
  RxString previewTopicName = ''.obs;
  RxString previewTopicDescription = ''.obs;
  RxString previewSelectedFile = ''.obs;
  RxString previewSelectedPdf = ''.obs;

  RxBool isPreviewing = false.obs;


  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     getArguments();});
    super.onInit();
  }


  void getArguments()async{
    final Map<String, dynamic> arguments = Get.arguments;
    subjectName = arguments['subjectName'];
    subjectId = arguments['subjectId'];
    log('id...$subjectId');
    subjectsController.updateClassItems();
    await getChapters();
  }


  void previewMode() {
    isPreviewing.toggle();
    if (isPreviewing.isTrue) {
      previewChapterName.value = chapterNameController.text;
      previewTopicName.value = topicNameController.text;
      previewTopicDescription.value = topicDescriptionController.text;
      previewSelectedFile.value = selectedFile.value;
      previewSelectedPdf.value = selectedPdf.value;
    }
  }



Future<String?> pickPdfFile() async {
  List<String> pdfPaths = await Utils.pickMultipleFilesWithFilter(['pdf']);
  if (pdfPaths.isNotEmpty) {
    String pdfFilePath = pdfPaths.first;
    log('Selected PDF file path: $pdfFilePath');
    selectedPdf.value = pdfFilePath;
    await uploadFile(pdfFilePath);
  }
  return null;
}

Future<String?> pickVideoFile() async {
  List<String> videoPaths = await Utils.pickMultipleFilesWithFilter(['mp4', 'mov', 'avi', 'mkv']);
  if (videoPaths.isNotEmpty) {
    String videoFilePath = videoPaths.first;
    log('Selected video file path: $videoFilePath');
    selectedFile.value = videoFilePath;
    await uploadFile(videoFilePath);
    
  }
  return null;
}

//-----------------------File upload-------------------------------

  Future<void> uploadFile(String filePath) async {
    final File pickedFile = File(filePath);
    final extension = path.extension(pickedFile.path).replaceAll(".", "");

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


//-----------------------Add Chapter -------------------------------

Future<void> addChapter() async {
  if (chapterNameController.text.isEmpty ||
      topicNameController.text.isEmpty ||
      topicDescriptionController.text.isEmpty) {
    Utils.showMySnackbar(desc: 'Please fill all the fields');
    return;
  }

  String selectedSubjectId = subjectId;

  try {
    String? videoUrl = '';
    String? pdfUrl = '';

    if (selectedFile.value.isNotEmpty) {
      await uploadFile(selectedFile.value);
      videoUrl = fileUpload.value.url;
    }

    if (selectedPdf.value.isNotEmpty) {
      await uploadFile(selectedPdf.value);
      pdfUrl = fileUpload.value.url;
    }

    var body = ChapterModel();
    body.subjectId = selectedSubjectId;
    body.chapterName = chapterNameController.text;
    body.concept = topicNameController.text;
    body.desc = topicDescriptionController.text;
    body.video = videoUrl;
    body.uploadPdf = pdfUrl;

    final response = await APIManager.createChapter(body: body);
    if (response.data['status'] == true) {

      log('chapter response...${response.data}');

      Get.find<GlobalData>().chapterId.value = response.data['data']['_id'].toString();

      Utils.showMySnackbar(desc: 'Chapter created successfully');

      Get.offAllNamed(Routes.ADD_QUESTIONS,arguments: {'subjectName':subjectName});
    } else {
      Utils.showMySnackbar(desc: response.data['message']);
    }
  } catch (error) {
    log('chapterError..$error');
  }
}


//-----------------------Get Chapter's -------------------------------

   Future<void> getChapters()async{
    isLoding(true);
    try {
      final responce = await APIManager.getChapter(subjectId: subjectId);
      if (responce.statusCode == 200) {
        //log('chapters...${responce.data}');
       chapters.value = ChaptersModel.fromJson(responce.data);  
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }


  @override
  void onClose() {
    chapterNameController.dispose();
    topicNameController.dispose();
    topicDescriptionController.dispose();
    super.onClose();
  }
}
