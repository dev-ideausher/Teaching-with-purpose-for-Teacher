import 'package:flutter/material.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: context.kPrimary));
  }
}