import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabNavigationController extends GetxController {
  // Current selected tab index
  var currentIndex = 0.obs;

  // GlobalKeys for each nested navigator
  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(), // Home
    GlobalKey<NavigatorState>(), // Learn
    GlobalKey<NavigatorState>(), // Actions
    GlobalKey<NavigatorState>(), // Profile
  ];

  // Method to change tabs
  void changeTab(int index) {
    if (currentIndex.value == index) {
      // If tapping the same tab, pop to root
      popToRoot(index);
    } else {
      // Reset the navigation state of the previous tab by popping to root
      if (currentIndex.value >= 0 &&
          currentIndex.value < navigatorKeys.length) {
        popToRoot(currentIndex.value);
      }
      // Change to new tab
      currentIndex.value = index;
    }
  }

  // Method to pop to root of a specific tab
  void popToRoot(int tabIndex) {
    if (tabIndex >= 0 && tabIndex < navigatorKeys.length) {
      final navigator = navigatorKeys[tabIndex].currentState;
      if (navigator != null && navigator.canPop()) {
        navigator.popUntil((route) => route.isFirst);
      }
    }
  }

  // Method to push a new route in current tab
  Future<T?> push<T extends Object?>(Widget page) {
    final navigator = navigatorKeys[currentIndex.value].currentState;
    if (navigator != null) {
      return navigator.push<T>(MaterialPageRoute(builder: (context) => page));
    }
    return Future.value(null);
  }

  // Method to push replacement in current tab
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page,
  ) {
    final navigator = navigatorKeys[currentIndex.value].currentState;
    if (navigator != null) {
      return navigator.pushReplacement<T, TO>(
        MaterialPageRoute(builder: (context) => page),
      );
    }
    return Future.value(null);
  }

  // Method to pop current route
  bool pop<T extends Object?>([T? result]) {
    final navigator = navigatorKeys[currentIndex.value].currentState;
    if (navigator != null && navigator.canPop()) {
      navigator.pop<T>(result);
      return true;
    }
    return false;
  }

  // Check if current tab can pop
  bool canPop() {
    final navigator = navigatorKeys[currentIndex.value].currentState;
    return navigator?.canPop() ?? false;
  }
}
