import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../../../data/models/time_table_model.dart';
import '../controllers/schedule_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
      preferredSize: Size.fromHeight(46.kh),
      child: CustomAppBar(title: 'Schedule', isBack: false)),
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
              Obx(() => Text(
                    "${controller.formattedDate}",
                    style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
                  )),
              16.kheightBox,
              Obx(() => timeTable()),
              32.kheightBox,
              Text(
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
            ],
          ),
        ),
      ),
    );
  }

//examSheet Widget list
  Widget examSheetWidget(String text,SvgGenImage img1,SvgGenImage img2,void Function() onTap) {
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


Widget timeTable(){
    RxList<TimeTableModel>? selectedDayTable;

    switch (DateFormat('EEEE').format(controller.selectedDate.value)) {
      case 'Monday':
        selectedDayTable = controller.mondayTable;
        break;
      case 'Tuesday':
        selectedDayTable = controller.tuesdayTable;
        break;
      case 'Wednesday':
        selectedDayTable = controller.wednesdayTable;
        break;
      case 'Thursday':
        selectedDayTable = controller.thursdayTable;
        break;
      case 'Friday':
        selectedDayTable = controller.fridayTable;
        break;
      default:
        selectedDayTable = <TimeTableModel>[].obs ;
    }
  return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Time', style:TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              Text('Subject', style:TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              Text('Class', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))
            ],
          ),
        ),
        24.kheightBox,
        SizedBox(
          width: double.infinity,
          child: Column(
            children: List.generate(
              selectedDayTable.length,
                (index) {
              final data = selectedDayTable![index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text( data.time?? '',
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color:Get.context!.kLightTextColor)),

                  Text( data.subject?? '',
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color:Get.context!.kLightTextColor)),

                  Text("${controller.classSchedule.value.data?[index]?.className?? ''}-${controller.classSchedule.value.data?[index]?.section?? ''}",
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))
                ],
              );
            }),
          ),
        ),
      ],
    );
}
}
