import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tab_navigation_controller.dart';

/// Helper class for navigation within tabs
///
/// Usage examples:
///
/// 1. Navigate to a new screen in current tab:
///    TabNavigation.push(context, MyNewScreen());
///
/// 2. Replace current screen with new one:
///    TabNavigation.pushReplacement(context, MyNewScreen());
///
/// 3. Go back to previous screen:
///    TabNavigation.pop(context);
///
/// 4. Check if can go back:
///    bool canGoBack = TabNavigation.canPop(context);
///
/// 5. Switch to specific tab (this will reset the tab's navigation stack):
///    TabNavigation.changeTab(2); // Switch to Actions tab (index 2)
///
/// 6. Pop to root of current tab:
///    TabNavigation.popToRoot();

class TabNavigation {
  static TabNavigationController get _controller =>
      Get.find<TabNavigationController>();

  /// Push a new screen in the current tab
  static Future<T?> push<T extends Object?>(BuildContext context, Widget page) {
    return _controller.push<T>(page);
  }

  /// Replace the current screen with a new one
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    BuildContext context,
    Widget page,
  ) {
    return _controller.pushReplacement<T, TO>(page);
  }

  /// Pop the current screen
  static bool pop<T extends Object?>(BuildContext context, [T? result]) {
    return _controller.pop<T>(result);
  }

  /// Check if current tab can pop
  static bool canPop(BuildContext context) {
    return _controller.canPop();
  }

  /// Switch to a specific tab (0: Home, 1: Learn, 2: Actions, 3: Profile)
  /// This will reset the navigation state of the previous tab
  static void changeTab(int tabIndex) {
    _controller.changeTab(tabIndex);
  }

  /// Pop to root of current tab
  static void popToRoot() {
    _controller.popToRoot(_controller.currentIndex.value);
  }

  /// Get current tab index
  static int get currentTabIndex => _controller.currentIndex.value;
}
