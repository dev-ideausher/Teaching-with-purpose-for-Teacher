import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/commom_loader.dart';
import 'package:teaching_with_purpose/app/components/custom_card_vertical.dart';
import 'package:teaching_with_purpose/app/components/custom_class_card.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose/app/modules/profile/controllers/profile_controller.dart';
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
      body: Obx(() => controller.isLoding.value?
      const Loader():
      SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTeacherSection(),
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
                        imageWidget: Assets.svg.myClass.svg(),text: StringConstants.myclass, onTap: () => Get.toNamed(Routes.MY_CLASSES)),
                    CustomClassCard(
                        imageWidget: Assets.svg.subjects.svg(),text: StringConstants.subjects, onTap: ()=> Get.toNamed(Routes.SUBJECTS)),
                    CustomClassCard(
                        imageWidget: Assets.svg.assignment.svg(),text: StringConstants.assignment, onTap: () => Get.toNamed(Routes.ASSIGNMENTS)),
                    CustomClassCard(
                        imageWidget: Assets.svg.quiz.svg(),text: StringConstants.quiz, onTap: () => Get.toNamed(Routes.LIVE_QUIZZ)),
                    CustomClassCard(
                        imageWidget: Assets.svg.result.svg(),text: StringConstants.result, onTap: () => Get.toNamed(Routes.RESULTS)),
                    CustomClassCard(
                        imageWidget: Assets.svg.marks.svg(),text: StringConstants.marks, onTap: () => Get.toNamed(Routes.MARKS)),
                  ],
                ),
                32.kheightBox,
               WidgetConstants.rowWidget('Announcements', 'See all', () => Get.toNamed(Routes.ANNOUNCEMENTS)),
                16.kheightBox,
                announcementWidget(),
                32.kheightBox,
              WidgetConstants.rowWidget('Events', 'See all', () => Get.toNamed(Routes.EVENTS)),
                16.kheightBox,
                SizedBox(
                  height: 156.kh,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => 16.kwidthBox,
                    itemCount: controller.eventModel.value.data?.length?? 0,
                    itemBuilder: (context, index) {
                      String time = controller.eventModel.value.data?[index]?.date?? '';
                      String formatTime = controller.formatTimestamp(time);
                      return CustomCardVertical(
                        borderColor: context.kLightred,
                        title: controller.eventModel.value.data?[index]?.name?? '',
                        text1: formatTime,
                        text2: controller.eventModel.value.data?[index]?.desc?? '',
                        imagePath: controller.eventModel.value.data?[index]?.image?? '');
                    },
               ),
             ),
          ],
        )),
      ),)
    );
  }

// section for the teacher
  Widget buildTeacherSection() {
    return Obx(() => Get.find<ProfileController>().isLoding.value?
    CircularProgressIndicator(color: Get.context!.kPrimary):
    SizedBox(
      width: 343.kw,
      height: 89.kh,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: buildProfileImg()),
            16.kwidthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, ${Get.find<ProfileController>().teachermodel.value.data?.first?.name ?? ''}',
                  style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
                ),
                8.kheightBox,
                Text(
                  'Subject: Mathematics',
                  style: TextStyleUtil.kText14_4(
                      fontWeight: FontWeight.w400,
                      color: Get.context!.kNeutral),
                ),
              ],
            ),
            97.kwidthBox,
            Icon(
              Icons.notifications_none_outlined,
              color: Get.context!.kPrimary,
            )
          ],
        ),
      ),
    )
    );
  }

//image logic
  Widget buildProfileImg() {
    if (Get.find<ProfileController>().teachermodel.value.data?.first?.image !=null) {
      return CachedNetworkImage(
          imageUrl:
              Get.find<ProfileController>().teachermodel.value.data?.first?.image ??'',
          width: 48.kw,
          height: 48.kh,
          fit: BoxFit.cover);
    }
    return Assets.images.profileSmall.image(height: 48.kh, width: 48.kw, fit: BoxFit.cover);
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
                  controller.announcement.value.data?.first?.postedBy?? 'Principal',
                  textAlign: TextAlign.center,
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                ),
                16.kheightBox,
                Text(
                  controller.announcement.value.data?.first?.desc?? '',
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
