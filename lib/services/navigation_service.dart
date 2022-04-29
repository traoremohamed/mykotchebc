import 'package:badges/badges.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../core.dart';

class NavigationService {
  List<BubbleBottomBarItem> getNavigationItemList() {
    return <BubbleBottomBarItem>[
      BubbleBottomBarItem(
          backgroundColor: kPrimaryColor,
          icon: Icon(
            LineIcons.home,
            color: Colors.black54,
          ),
          activeIcon: Icon(LineIcons.home),
          title: Text("Mon espace")),
      /*BubbleBottomBarItem(
          backgroundColor: kPrimaryColor,
          icon: Icon(
            LineIcons.search,
            color: Colors.black54,
          ),
          activeIcon: Icon(LineIcons.search),
          title: Text("Services")),*/
      BubbleBottomBarItem(
          backgroundColor: kPrimaryColor,
          icon: Badge(
            padding:
                EdgeInsets.only(top: 5.0, bottom: 5.0, right: 4.0, left: 5.0),
            animationType: BadgeAnimationType.scale,
            animationDuration: Duration(milliseconds: 200),
            badgeContent: Text(
              '3',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            child: Icon(
              LineIcons.bell,
              color: Colors.black54,
            ),
          ),
          activeIcon: Icon(LineIcons.bell),
          title: Text("Notifications")),
      BubbleBottomBarItem(
          backgroundColor: kPrimaryColor,
          icon: Icon(
            LineIcons.userAlt,
            color: Colors.black54,
          ),
          activeIcon: Icon(LineIcons.user),
          title: Text("Profil"))
    ];
  }
}
