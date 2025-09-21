import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seaguard/pages/home_screen_fixed.dart';
import 'package:seaguard/pages/learn_screen_new.dart';
import '../controllers/tab_navigation_controller.dart';
import '../widgets/nav_bar.dart';
import '../pages/actions_screen.dart';
import '../pages/profile_screen.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TabNavigationController tabController = Get.put(
      TabNavigationController(),
    );

    // List of root pages for each tab
    final List<Widget> pages = [
      const HomeScreenFixed(),
      const LearnScreenNew(),
      const ActionsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: tabController.currentIndex.value,
          children: pages.asMap().entries.map((entry) {
            final int index = entry.key;
            final Widget page = entry.value;

            return Navigator(
              key: tabController.navigatorKeys[index],
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(
                  builder: (context) => page,
                  settings: routeSettings,
                );
              },
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavbBar(
          currentIndex: tabController.currentIndex.value,
          onTabChange: tabController.changeTab,
        ),
      ),
    );
  }
}
