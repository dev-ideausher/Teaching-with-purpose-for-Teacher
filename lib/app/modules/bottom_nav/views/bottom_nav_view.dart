import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose/app/constants/string_constants.dart';
import 'package:teaching_with_purpose/app/modules/home/views/home_view.dart';
import 'package:teaching_with_purpose/app/modules/profile/views/profile_view.dart';
import 'package:teaching_with_purpose/app/modules/schedule/views/schedule_view.dart';
import 'package:teaching_with_purpose/app/services/colors.dart';
import 'package:teaching_with_purpose/app/services/responsive_size.dart';
import 'package:teaching_with_purpose/gen/assets.gen.dart';
import '../../../components/custom_icon.dart';
import '../controllers/bottom_nav_controller.dart';

class BottomNavbarView extends GetView<BottomNavController> {
  const BottomNavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
            index: controller.currentIndex.value, children: tabViews());
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.chnageIndex(index),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Get.context!.kPrimary,
          selectedFontSize: 12.kh,
          unselectedFontSize: 12.kh,
          backgroundColor: Get.context!.kWhite,
          unselectedItemColor: Get.context!.kBottomNavgrey,
          items: _buildBottomNavBarItems())),
    );
  }

  List<Widget> tabViews() {
    return const [HomeView(), ScheduleView(), ProfileView()];
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    return [
      _buildBottomNavBarItem(
          imgPath: Assets.svg.home, index: 0, label: StringConstants.home),
      _buildBottomNavBarItem(
          imgPath: Assets.svg.schedule,
          index: 1,
          label: StringConstants.schedule),
      _buildBottomNavBarItem(
          imgPath: Assets.svg.person, index: 2, label: StringConstants.profile),
    ];
  }

  BottomNavigationBarItem _buildBottomNavBarItem(
      {required SvgGenImage imgPath,
      required int index,
      required String label}) {
    return BottomNavigationBarItem(
      icon: CustomIcon(
        svgImg: imgPath,
        color: controller.currentIndex.value == index
            ? Get.context!.kPrimary
            : Get.context!.kBottomNavgrey,
      ),
      label: label,
    );
  }
}
