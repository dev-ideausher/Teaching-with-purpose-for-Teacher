import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../controllers/announcements_controller.dart';

class AnnouncementsView extends GetView<AnnouncementsController> {
  const AnnouncementsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final announcement = Get.find<HomeController>().announcement.value.data;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Announcements', isBack: true)),
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
              if (announcement != null && announcement.isNotEmpty)
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => 8.kheightBox,
                  itemCount: announcement.length,
                  itemBuilder: (context, index) {
                    String time = announcement[index]?.date ?? '';
                    String formattedTime =
                        Get.find<HomeController>().formatTimestamp(time);
                    return annoucementWidget(
                      name: announcement[index]?.name ?? '',
                      desc: announcement[index]?.desc ?? '',
                      time: formattedTime,
                    );
                  },
                )
              else
                Center(
                  child: Column(
                    children: [
                      Assets.svg.speaker.svg(),
                      16.kheightBox,
                      Text(
                        'No announcements Found!',
                        style: TextStyleUtil.kText18_6(
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              // 20.kheightBox,
              //   Text(
              //     'Yesterday',
              //     style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              //   ),
              // 16.kheightBox,
              // annoucementWidget(name: '', desc: '', time: ''),
              // 8.kheightBox,
              // annoucementWidget(name: '', desc: '', time: '')
            ],
          ),
        ),
      ),
    );
  }

//
  Widget annoucementWidget(
      {required String name, required String desc, required String time}) {
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
                    name,
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                  ),
                  4.kheightBox,
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kLightTextColor),
                  ),
                ],
              ),
            ),
            Text(
              time,
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
