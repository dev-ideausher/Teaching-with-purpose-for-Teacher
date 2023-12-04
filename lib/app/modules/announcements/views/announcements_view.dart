import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import '../controllers/announcements_controller.dart';

class AnnouncementsView extends GetView<AnnouncementsController> {
  const AnnouncementsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
            16.kheightBox,
            annoucementWidget(),
            8.kheightBox,
            annoucementWidget(),
            8.kheightBox,
            annoucementWidget(),
            20.kheightBox,
              Text(
                'Yesterday',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
            16.kheightBox,
            annoucementWidget(),
            8.kheightBox, 
            annoucementWidget(),          
            ],
          ),
        ),
      ),
    );
  }

// appbar widget
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
        'Announcements',
        textAlign: TextAlign.center,
        style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget annoucementWidget() {
    return SizedBox(
      height: 82.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 8.kh,
              width: 8.kw,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Get.context!.kRed),
            ),
            12.kwidthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Principal',
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                  ),
                  4.kheightBox,
                  Text(
                    StringConstants.announcementText2,
                    maxLines: 2,
                    style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kLightTextColor),
                  ),
                ],
              ),
            ),
            Text(
              '12:44 pm',
              maxLines: 2,
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400,
                  color: Get.context!.kLightTextColor),
            )
          ],
        ),
      ),
    );
  }
}
