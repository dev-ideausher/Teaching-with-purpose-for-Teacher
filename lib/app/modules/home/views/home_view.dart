import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_card_vertical.dart';
import 'package:teaching_with_purpose/app/components/custom_class_card.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.kGreyBack,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                studentSection(
                    Assets.images.profileSmall
                        .image(height: 48.kh, width: 48.kw),
                    'Hi, Patrick',
                    'Subject: Mathematics',
                    Icon(
                      Icons.notifications_none_outlined,
                      color: context.kPrimary,
                    )),
                32.kheightBox,
                clockWidget(),
                32.kheightBox,
                Text('My Classes',
                    textAlign: TextAlign.center,
                    style:
                        TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
                16.kheightBox,
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.84,
                          crossAxisCount: 3,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 27.5),
                  children: [
                    CustomClassCard(
                        imageWidget: Assets.svg.myClass.svg(),
                        text: StringConstants.myclass, onTap: () => Get.toNamed(Routes.MY_CLASSES)),
                    CustomClassCard(
                        imageWidget: Assets.svg.subjects.svg(),
                        text: StringConstants.subjects, onTap: ()=> Get.toNamed(Routes.SUBJECTS)),
                    CustomClassCard(
                        imageWidget: Assets.svg.assignment.svg(),
                        text: StringConstants.assignment, onTap: () => Get.toNamed(Routes.ASSIGNMENTS)),
                    CustomClassCard(
                        imageWidget: Assets.svg.quiz.svg(),
                        text: StringConstants.quiz,onTap: () => Get.toNamed(Routes.LIVE_QUIZZ)),
                    CustomClassCard(
                        imageWidget: Assets.svg.result.svg(),
                        text: StringConstants.result,onTap: () => Get.toNamed(Routes.RESULTS)),
                    CustomClassCard(
                        imageWidget: Assets.svg.marks.svg(),
                        text: StringConstants.marks, onTap: () => Get.toNamed(Routes.MARKS)),
                  ],
                ),
                32.kheightBox,
                rowWidget('Announcements', 'See all', () => Get.toNamed(Routes.ANNOUNCEMENTS)),
                16.kheightBox,
                announcementWidget(),
                32.kheightBox,
                rowWidget('Events', 'See all', () => Get.toNamed(Routes.EVENTS)),
                16.kheightBox,
                SizedBox(
                  height: 156.kh,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => 16.kwidthBox,
                    itemCount: 3,
                    itemBuilder: (context, index) => CustomCardVertical(
                        borderColor: context.kLightred,
                        title: controller.eventsTitile[index],
                        text1: controller.time[index],
                        text2: controller.detailsText[index],
                        imagePath: controller.eventImages[index]),
               ),
             ),
          ],
        )),
      ),
    );
  }

// section for the student details like roll Number and name with img
  Widget studentSection(
      Image teacherImg, String text1, String text2, Icon icon) {
    return SizedBox(
      width: 343.kw,
      height: 81.kh,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(image: teacherImg.image)),
            16.kwidthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  textAlign: TextAlign.center,
                  style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
                ),
                8.kheightBox,
                Text(
                  text2,
                  textAlign: TextAlign.center,
                  style: TextStyleUtil.kText14_4(
                      fontWeight: FontWeight.w400,
                      color: Get.context!.kNeutral),
                ),
              ],
            ),
            97.kwidthBox,
            Icon(icon.icon, color: Get.context!.kPrimary)
          ],
        ),
      ),
    );
  }

// custom clock widget
  clockWidget() {
    return SizedBox(
      height: 192.kh,
      width: 343.kw,
      child: Card(
        elevation: 0.2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let’s get to work !',
                textAlign: TextAlign.center,
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              8.kheightBox,
              Center(
                child: Column(
                  children: [
                    Obx(() {
                      final bgColor = controller.isClockIn.value
                          ? Get.context!.kPrimary
                          : Get.context!.kRed;
                      final buttonText =
                          controller.isClockIn.value ? 'Clock In' : 'Clock Out';
                      return InkWell(
                        onTap: () => controller.toggleClock(),
                        child: Container(
                          height: 96.kh,
                          width: 96.kw,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: bgColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: controller.isClockIn.value
                                      ? Get.context!.kLightgreen
                                      : Get.context!.kLightred)),
                          child: Text(
                            buttonText,
                            textAlign: TextAlign.center,
                            style: TextStyleUtil.kText14_4(
                                fontWeight: FontWeight.w600,
                                color: Get.context!.kWhite),
                          ),
                        ),
                      );
                    }),
                    16.kheightBox,
                    Obx(
                      () => Text(
                        controller.timerText.value,
                        textAlign: TextAlign.center,
                        style: TextStyleUtil.kText12_4(
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// insted of use multiple row in  a single tree
  rowWidget(String title, String subtitle, void Function() onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            textAlign: TextAlign.center,
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
        149.kwidthBox,
        InkWell(
          onTap: onTap,
          child: Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400, color: Get.context!.kPrimary)),
        )
      ],
    );
  }

//announcement widget
  Widget announcementWidget() {
    return SizedBox(
      height: 180.kh,
      width: 343.kw,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Principal',
                  textAlign: TextAlign.center,
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                ),
                16.kheightBox,
                Text(
                  StringConstants.announcementText,
                  maxLines: 5,
                  style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Assets.svg.discusionDec.svg(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Assets.svg.discusionDec.svg(),
          )
        ],
      ),
    );
  }
}
