import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamrosampada/utils/dt_colors.dart';
import 'package:hamrosampada/view/screens/dashboard/live_location_screen.dart';
import '../controller/expnanded_nav_controller.dart';
import '../view/screens/dashboard/dashboard_screen.dart';
import '../view/screens/dashboard/home_screen.dart';
import '../view/screens/dashboard/inbox_screen.dart';
import '../view/screens/profile_detail_screens/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hamrosampada/utils/dt_colors.dart';
import '../controller/expnanded_nav_controller.dart';
import '../view/screens/dashboard/dashboard_screen.dart';
import '../view/screens/dashboard/home_screen.dart';
import '../view/screens/dashboard/inbox_screen.dart';
import '../view/screens/profile_detail_screens/profile_screen.dart';
import '../view/screens/dashboard/live_location_screen.dart';

class ExpandedBottomNavBar extends StatefulWidget {
  @override
  State<ExpandedBottomNavBar> createState() => _ExpandedBottomNavBarState();
}

class _ExpandedBottomNavBarState extends State<ExpandedBottomNavBar> {
  late ExpandedNavController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ExpandedNavController());
  }

  @override
  Widget build(BuildContext context) {
    var navBody = [
      DashboardScreen(),
      HomeScreen(),
      InboxScreen(),
      ProfileScreen(),
    ];

    return WillPopScope(
      onWillPop: () async {
        if (controller.currentNavIndex.value == 0) {
          SystemNavigator.pop();
          return false;
        } else {
          controller.currentNavIndex.value = 0;
          return false;
        }
      },
      child: Scaffold(
        body: Obx(() {
          // Only this part rebuilds when `currentNavIndex` changes
          return navBody[controller.currentNavIndex.value];
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LiveLocationScreen()));
          },
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.north_east, color: Colors.white),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.r)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() {
          // Only rebuilds the BottomAppBar
          return BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Home and Address buttons
                Expanded(
                  child: IconButton(
                    icon: Image.asset(
                      'assets/home.png',
                      width: 24.w,
                      height: 24.h,
                      color: controller.currentNavIndex.value == 0
                          ? Colors.red
                          : const Color(0xff868686),
                    ),
                    onPressed: () {
                      controller.currentNavIndex.value = 0;
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset(
                      'assets/address.png',
                      width: 24.w,
                      height: 24.h,
                      color: controller.currentNavIndex.value == 1
                          ? Colors.red
                          : const Color(0xff868686),
                    ),
                    onPressed: () {
                      controller.currentNavIndex.value = 1;
                    },
                  ),
                ),
                // Spacer for the FAB
                const SizedBox(width: 48),
                // Inbox and Profile buttons
                Expanded(
                  child: IconButton(
                    icon: Image.asset(
                      'assets/inbox.png',
                      width: 24.w,
                      height: 24.h,
                      color: controller.currentNavIndex.value == 2
                          ? Colors.red
                          : const Color(0xff868686),
                    ),
                    onPressed: () {
                      controller.currentNavIndex.value = 2;
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset(
                      'assets/user.png',
                      width: 24.w,
                      height: 24.h,
                      color: controller.currentNavIndex.value == 3
                          ? Colors.red
                          : const Color(0xff868686),
                    ),
                    onPressed: () {
                      controller.currentNavIndex.value = 3;
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}


