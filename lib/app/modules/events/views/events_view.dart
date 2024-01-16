
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../controllers/events_controller.dart';

class EventsView extends GetView<EventsController> {
  const EventsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Events', isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              selectMonthDropDawn(),
              32.kheightBox,
             SizedBox(
              height: 842.kh,
              width: 343.kw,
              child:ListView.separated(
                      separatorBuilder:(context, index) => 8.kheightBox,
                      itemCount: 1,
                      itemBuilder: (context, index){
                      String time = Get.find<HomeController>().eventModel.value.data?[index]?.date ?? '';
                      String formattedTime = Get.find<HomeController>().formatTimestamp(time);
                    return eventCardWidget(
                    image: Get.find<HomeController>().eventModel.value.data?[index]?.image == null?
                    Image.asset(Assets.images.eventimg1.path,height: 55.kh,width: 55.kw,fit: BoxFit.cover):
                    CachedNetworkImage(imageUrl:Get.find<HomeController>().eventModel.value.data?[index]?.image?? '',height: 55.kh,width: 55.kw,fit: BoxFit.cover),
                    title: Get.find<HomeController>().eventModel.value.data?[index]?.name ?? 'Sports Day',
                    date: formattedTime,
                    description: Get.find<HomeController>().eventModel.value.data?[index]?.desc ?? ''
                  ); 
                },
               )
             )
            ],
          ),
        ),
      ),
    );
  }

// list of month dropDawn
  Widget selectMonthDropDawn() {
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select month',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,
                    color: Get.context!.kLightTextColor),
              ),
              items: controller.items
                  .map((String item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item,style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))))
                  .toList(),
              value: controller.selectedValue.value,
              onChanged: (String? value) => controller.selectedMonth(value!),
            ),
          ),
        ));
  }

// event card Widget
  Widget eventCardWidget({ required Widget image,  required String title, required String date, required String description}) {
    return SizedBox(
      height: 162.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: image),
            16.kwidthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                  ),
                  4.kheightBox,
                  Text(
                    date,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                  ),
                  8.kheightBox,
                  Text(
                   description,
                    maxLines: 4,
                    style: TextStyleUtil.kText12_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kLightTextColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
