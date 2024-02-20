import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Assignment', isBack: true)),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My classes',
                  style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              16.kheightBox,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.3,
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 16),
                itemCount: controller.subjectsController.classModel.value.data?.length,
                itemBuilder: (context, index) => 
                classContainer(
                  controller.subjectsController.classModel.value.data?[index]?.className?? '', 
                  () {
                    Get.toNamed(Routes.SELECT_SUB);
                  }),
              ),
            ],
          ),
        ));
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
