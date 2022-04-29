import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:mykotche/models/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class MainView extends GetView<MainController> {

  MainController mCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Obx(()=> Text("${mCont.currentUsers.value.name}", style: TextStyle(color: Colors.black),)),
      ),*/
      body: PageView(
        controller: controller.pageCotroller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeView(),
          /*SearchView(),*/
          NotificationView(),
          ProfileView()
        ],
      ),
      bottomNavigationBar: ValueBuilder<int>(
        initialValue: 0,
        builder: (value, updateFn) => Container(
          color: Colors.grey[200],
          child: BubbleBottomBar(
            opacity: .2,
            currentIndex: value,
            onTap: (tab) {
              // if (tab == 2) HomeController.to.showAppOpenAd();

              controller.pageCotroller.animateToPage(
                tab,
                duration: controller.animationDuration,
                curve: Curves.ease,
              );
              updateFn(tab);
            },
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            elevation: 8,
            hasInk: true, //new, gives a cute ink effect
            items: controller.navigationItems,
          ),
        ),
      ),
    );
  }
}
