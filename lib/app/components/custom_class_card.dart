import 'package:flutter/material.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/app/services/text_style_util.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

// ignore: must_be_immutable
class CustomClassCard extends StatelessWidget {
  final Widget imageWidget;
  final String text;
  void Function() onTap;
 CustomClassCard({super.key, required this.imageWidget, this.text = '', required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 113.kh,
        width: 96.kw,
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 1.129,
                child: Stack(
                  children: [
                    Center(child: imageWidget),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Assets.svg.ellipseLight.svg(),
                    )
                  ],
                )),
            7.kheightBox,
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
