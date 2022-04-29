import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:mykotche/models/users.dart';
import 'package:mykotche/utils/user_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class MainController extends GetxController {

  var currentUsers = Users.empty().obs;

  final pageCotroller = PageController();
  final animationDuration = const Duration(milliseconds: 350);
  List<BubbleBottomBarItem> navigationItems;

  @override
  void onInit() {
    navigationItems = NavigationService().getNavigationItemList();
    super.onInit();
  }

  @override
  void onReady() {

    currentUsers(UserManagement.readUser());

    super.onReady();
  }

  @override
  void onClose() {
    pageCotroller.dispose();

    debugPrint("[ MainController ] => onClose()");
    super.onClose();
  }
}
