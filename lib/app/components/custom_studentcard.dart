import 'package:flutter/material.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

class CustomStudentCard extends StatelessWidget {
  final Image stdImage;
  final String text1;
  final String text2;
  final SvgGenImage icon;
 final  void Function() onTap;
  const CustomStudentCard({
    super.key,
    required this.stdImage,
    required this.text1,
    required this.text2,
    required this.icon, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 66.kh,
          width: 343.kw,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Row(
              children: [
                Image(image: stdImage.image, height: 40.kh, width: 40.kw),
                12.kwidthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                    ),
                    4.kheightBox,
                    Text(
                      text2,
                      style: TextStyleUtil.kText14_4(
                          fontWeight: FontWeight.w400,
                          color: context.kLightTextColor),
                    ),
                  ],
                ),
                const Spacer(),
                icon.svg()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
