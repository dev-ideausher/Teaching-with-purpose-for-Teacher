import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/routes/app_pages.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/custom_button.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../controllers/on_board_controller.dart';

class GetStartedView extends GetView<OnBoardController> {
  const GetStartedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 142, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: getStartedWidget(
                  img: Assets.images.getStarted.image(height: 300.kh,width: 300.kw),
                  title: StringConstants.getStarted,
                  subTitle: StringConstants.getStartedText),
            ),
            123.kheightBox,
            TButton(
                title: StringConstants.login,
                onTap: () => Get.toNamed(Routes.LOGIN)),
          ],
        ),
      ),
    );
  }

  //custom Widget for img and text

  Widget getStartedWidget(
      {required Image img, required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: img.image),
        38.kheightBox,
        Text(
          title,
          style: TextStyleUtil.kText24_6(fontWeight: FontWeight.w700),
        ),
        16.kheightBox,
        Text(
          subTitle,
          style: TextStyleUtil.kText16_5(
              fontWeight: FontWeight.w400, color: Get.context!.kNeutral),
        ),
      ],
    );
  }
}
