
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';

class Utils{
  static showMySnackbar({String title = "Notification", required String desc}) {
    Get.snackbar(
      title,
      desc,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      isDismissible: true,
      backgroundColor: Get.context!.kPrimary,
      titleText: Text(
        title,
        style: TextStyle(color:Get.context!.kWhite), 
      ),
      messageText: Text(
        desc,
        style: TextStyle(color:Get.context!.kWhite), 
      ),

    );
  } 

   static Future<File?> pickImageFromGallery() async {
    File? image;
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    } catch (e) {
      showMySnackbar(desc: e.toString());
    }
    return image;
  }

  
 static Future<List<String>> pickMultipleFilesWithFilter(List<String> allowedExtensions) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
      );

      if (result != null) {
        return result.paths.map((path) => path!).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error picking multiple files: $e');
      return [];
    }
  } 
}