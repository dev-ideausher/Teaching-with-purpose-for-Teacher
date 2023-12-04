import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

import '../controllers/assignments_controller.dart';

class AssignmentsView extends GetView<AssignmentsController> {
  const AssignmentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My classes',
                  style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              16.kheightBox,
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.3,
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 16),
                children: [
                  classContainer('8-A', () => Get.toNamed(Routes.ASSIGNMENT_UPLODED)),
                  classContainer('8-B', () {}),
                  classContainer('9-D', () {}),
                  classContainer('10-A', () {}),
                  classContainer('10-C', () {}),
                ],
              ),
            ],
          ),
        ));
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
        'Assignment',
        textAlign: TextAlign.center,
        style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget classContainer(String text, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.kh,
        width: 104.kw,
        decoration: BoxDecoration(
            color: Get.context!.kWhite, borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Assets.svg.ellipseLight.svg(),
            )
          ],
        ),
      ),
    );
  }
}
