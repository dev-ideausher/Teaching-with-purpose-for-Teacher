import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import 'dart:io' show Platform;
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                updateProfileImage(Assets.images.profileImgLarge.image(height: 100.kh,width: 100.kw), () {}),
                32.kheightBox,
                editProfileTextfelds('Full Name*', StringConstants.name,
                    controller.nameController),
                editProfileTextfelds('Email Address', StringConstants.emailAddress,
                    controller.emailController),
                editProfileTextfelds('Gender', StringConstants.gender,
                    controller.emailController),
                editProfileTextfelds('Age', StringConstants.age,
                    controller.emailController),
                56.kheightBox,
                SizedBox(
                    width: 343.kw,
                    height: 56.kh,
                    child: TButton(title: StringConstants.save, onTap: () {})),
                16.kheightBox,
                Container(
                  height: 56.kh,
                  width: 343.kw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.kGreyBack,
                      border: Border.all(color: context.kRed)),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Deactivite Account',
                      style: TextStyleUtil.kText16_5(
                          fontWeight: FontWeight.w500, color: context.kRed),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }






// abbbar widget
  appBarWidget() {
    IconData iconData =
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Get.context!.kGreyBack,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(iconData, color: Get.context!.kPrimary),
      ),
      title: Text(
        textAlign: TextAlign.center,
        'Profile',
        style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
      ),
    );
  }




  // widget for profile update
  Widget updateProfileImage(Image profileImg, void Function() onTap) {
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:Image(image: profileImg.image)
              ),
            ),
            Positioned(
                bottom: 12,
                right: 120,
                child: InkWell(
                    onTap: onTap,
                    child: Assets.svg.addPlus.svg(height: 29.kh, width: 29.kw)))
          ],
        ),
        8.kheightBox,
        Text(
            textAlign: TextAlign.center,
            'Take or upload profile photo',
            style: TextStyleUtil.kText14_4(
                fontWeight: FontWeight.w400,
                color: Get.context!.kLightTextColor))
      ],
    );
  }





// widget for calling textfiels insted of callin one by one
  Widget editProfileTextfelds(String title, String inputText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyleUtil.kText14_4(
                fontWeight: FontWeight.w500,
                color: Get.context!.kLightTextColor)),
        8.kheightBox,
        CustomTextField(
            hint: inputText,
            controller: controller,
            textInputType: TextInputType.emailAddress),
        16.kheightBox,
      ],
    );
  }
}
