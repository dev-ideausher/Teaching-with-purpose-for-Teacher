import 'package:flutter/material.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';

class CustomIcon extends StatelessWidget {
  final  SvgGenImage svgImg;
  final color;

  const CustomIcon({super.key, required this.svgImg, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: svgImg.svg(
        height: 24.kh,
        width: 24.kw,
        color: color

      )
    );
  }
}