import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose/app/components/custom_richtext.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../controllers/subjects_controller.dart';

class SubjectsView extends GetView<SubjectsController> {
  const SubjectsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Subjects',isBack: true)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subjectWidget(title: 'Mathematics', text1: 'Classes ', text2: '8-A, 8-B, 9-D',
                  image: Assets.svg.mathsSmall, onTap: () => Get.toNamed(Routes.SUBJECT_DETAILS)),
              16.kheightBox,
              subjectWidget(title: 'Chemistry', text1: 'Classes ', text2: '8-A, 8-B, 9-D',
                  image: Assets.svg.mathsSmall, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

//..
  Widget subjectWidget({required String title, required String text1, required String text2,required SvgGenImage image, required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 56.kh,
        width: 343.kw,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 40.kh,
                    width: 40.kw,
                    child: Center(
                      child: image.svg(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Assets.images.grupedEllipseSmall.image(),
                  )
                ],
              ),
              12.kwidthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                  ),
                  4.kheightBox,
                  Expanded(
                    child: ReUsableRichText(
                      text1: text1,
                      text2: text2,
                      style1:
                          TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                      style2: TextStyleUtil.kText14_4(
                          fontWeight: FontWeight.w400,
                          color: Get.context!.kLightTextColor),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 15)
            ],
          ),
        ),
      ),
    );
  }
}
