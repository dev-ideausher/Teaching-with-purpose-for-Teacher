import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';

class CommoncardTable extends StatelessWidget {
  const CommoncardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
    //  columnWidths:const <int, TableColumnWidth> {
    //  0:FixedColumnWidth(150),
    //  1:FlexColumnWidth(3),
    //  2: MaxColumnWidth(FlexColumnWidth(3), FractionColumnWidth(0.3)),
    // },
      defaultColumnWidth: const FixedColumnWidth(140),
      border: TableBorder.all(color: Colors.transparent),
      children:  [
        TableRow(
          children: [
            TableCell(child: Text('Time', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
            TableCell(child: Text('Subject', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
            TableCell(child: Text('Class', style:  TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('10.00 - 11.00 AM',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('Mathematics',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('8-B',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('11.00 - 12.00 AM',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('English',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('10-A',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('12.00 - 1.00 PM',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('BREAK',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kRed))),
            TableCell(child: Text('BREAK',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kRed))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('1.00 - 2.00 PM',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('English',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('10-C',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('2.00 - 3.00 PM',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('Mathematics',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('9-D',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
          ],
        ),
      ],
    );
  }
}