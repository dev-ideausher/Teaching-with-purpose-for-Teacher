import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_bottomsheet.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/app/utils/utils.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PreferredSize(preferredSize: Size.fromHeight(46.kh),
        child: CustomAppBar(title: 'Profile', isBack: false)),
        body: Obx(() => controller.isLoding.value?
        Center(child: CircularProgressIndicator(color: context.kPrimary)):
         SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileImage(),
                32.kheightBox,
                profileSectionWidget(Assets.svg.editProfile, 'Edit Profile',
                    ()=> Get.toNamed(Routes.EDIT_PROFILE)),
                8.kheightBox,
                profileSectionWidget(Assets.svg.attendance, 'My Attendance',
                    () => Get.toNamed(Routes.ATTENDANCE)),
                8.kheightBox,
                profileSectionWidget(Assets.svg.feedback, 'My Feedback',
                    () =>Get.toNamed(Routes.FEEDBACK)),
                8.kheightBox,
                profileSectionWidget(Assets.svg.ratingOutline,
                    'App Review & Ratings',
                    () => showBottomSheetWidget(context)),
                8.kheightBox,
                profileSectionWidget(
                    Assets.svg.language, 'Content Language', () {}),
                8.kheightBox,
                profileSectionWidget(Assets.svg.password, 'Change Password',
                    () => Get.toNamed(Routes.CHANGE_PASSWORD)),
                8.kheightBox,
                profileSectionWidget(Assets.svg.helpCircle, 'Help Center',
                    () => Get.toNamed(Routes.HELP_CENTER)),
                8.kheightBox,
                profileSectionWidget(Assets.svg.logout, 'Logout', () {
                  logoutWidget();
                }),
              ],
            ),
          ),
        )
        ));
  }

//
  Widget profileImage() {
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: imgWidget(),
              ),
            ),
            Positioned(
                bottom: 12,
                right: 120,
                child: InkWell(
                    onTap: () {},
                    child: Assets.svg.addPlus.svg(height: 29.kh, width: 29.kw)))
          ],
        ),
        8.kheightBox,
        Text(
          'Hi, ${controller.teachermodel.value.data?.first?.name ?? ''}',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }


  Widget imgWidget(){
    if (controller.teachermodel.value.data?.first?.image != null) {
      return CachedNetworkImage(imageUrl: controller.teachermodel.value.data?.first?.image ?? '',
          width: 100.kw,height: 100.kh,fit: BoxFit.cover);
    }
    return Assets.images.profileImgLarge.image(height: 100.kh,width: 100.kw,fit: BoxFit.cover);
  }


//
  Widget profileSectionWidget(SvgGenImage image, String title, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 57.kh,
        width: 343.kw,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Get.context!.kWhite),
        child: Row(
          children: [
            image.svg(),
            16.kwidthBox,
            Text(
                title,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
            const Spacer(),
             const Icon(Icons.arrow_forward_ios,size: 15)
          ],
        ),
      ),
    );
  }

//rating Section
  showBottomSheetWidget(BuildContext context) {
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ResponseBottomSheet(
        onTap: (double selectedRating){
        if(selectedRating > 0){

        controller.giveRating(selectedRating.toString());

        Get.back();

       } else{

        Utils.showMySnackbar(desc: 'Please select rating, Before Submitting');
          }
        },
        bottomSheetImg: Lottie.asset('assets/lottiefiles/rating.json'),
        title: 'Enjoying Teaching With Purpose ?',
        text1:'Support us by giving rate and your precious review !It will take few seconds only.',
        text2: 'Submit',
      ),
    );
  }

  // dialo box for log-out
  logoutWidget() {
    return Get.defaultDialog(
        title: 'Confirm Logout',
        titleStyle: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        middleText: 'Are you sure you want to logout ?',
        middleTextStyle: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400, color: Get.context!.kLightTextColor),
        cancel: TextButton(onPressed: ()=> Get.back(), child: const Text('No')),
        confirm: TextButton(
        onPressed: (){
          log('onTap');
          controller.logout();

        }, child: const Text('Logout'))
      );
  }
}
