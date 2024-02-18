import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Buttons',
      subTitle: 'Some buttons in Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined
  ),
  MenuItem(
      title: 'Cards',
      subTitle: 'A stylized container',
      link: '/cards',
      icon: Icons.credit_card
  ),
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Generals and controllers',
      link: '/progress',
      icon: Icons.refresh_rounded
  ),
  MenuItem(
      title: 'Snackbars and dialogs',
      subTitle: 'Indicators on screen',
      link: '/snackbars',
      icon: Icons.info_outline
  ),
  MenuItem(
      title: 'Animated container',
      subTitle: 'Stateful widget animated',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded
  )
];
