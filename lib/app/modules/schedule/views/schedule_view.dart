import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/common_time_table.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../controllers/schedule_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(46.kh),
        child: CustomAppBar(title: 'Schedule', isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Timetable',
                    style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.settings,
                    color: context.kPrimary,
                  )
                ],
              ),
              16.kheightBox,
              Obx(() => SfDateRangePicker(
                    selectionColor: context.kPrimary,
                    selectionMode: DateRangePickerSelectionMode.single,
                    onSelectionChanged:
                        (DateRangePickerSelectionChangedArgs args) =>
                            controller.setSelectedDate(args.value),
                    initialSelectedDate: controller.selectedDate.value,
                  )),
              32.kheightBox,
                    Text(
                    '${controller.formattedDate}',
                    style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
                  ),
              16.kheightBox,
              const CommoncardTable(),
              32.kheightBox,
              Text(
                  textAlign: TextAlign.center,
                  'Exam Datesheet',
                  style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              16.kheightBox,
              examSheetWidget(
                'Class 8th',
                Assets.svg.examSheet,
                Assets.svg.download,
                () => Get.toNamed(Routes.EXAM_DATE_SHEET),
              ),
              8.kheightBox,
              examSheetWidget('Class 9th', Assets.svg.examSheet,
                  Assets.svg.download, () {}),
              8.kheightBox,
              examSheetWidget('Class 10th', Assets.svg.examSheet,
                  Assets.svg.download, () {}),
            ],
          ),
        ),
      ),
    );
  }

//examSheet Widget list
  Widget examSheetWidget(
    String text,
    SvgGenImage img1,
    SvgGenImage img2,
    void Function() onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56.kh,
        width: 343.kw,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Row(
            children: [
              img1.svg(),
              15.kwidthBox,
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              img2.svg(),
              8.kwidthBox,
              const Icon(Icons.arrow_forward_ios, size: 15)
            ],
          ),
        ),
      ),
    );
  }
}
