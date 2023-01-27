import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation/constants.dart';

import '../main.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavItem(
              svgScr: "assets/icons/calendar.svg",
              title: 'Today',
              press: () {},
            ),
            BottomNavItem(
              svgScr: "assets/icons/gym.svg",
              title: 'Gym',
              press: () {},
              isActive: true,
            ),
            BottomNavItem(
              svgScr: "assets/icons/setting.svg",
              title: 'Settings',
              press: () {},
            ),
          ]),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final Function()? press;
  final bool isActive;
  const BottomNavItem({
    Key? key,
    required this.svgScr,
    required this.title,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr,
            width: 20,
            height: 30,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
