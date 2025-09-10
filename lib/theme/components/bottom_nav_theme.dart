import 'package:flutter/material.dart';

BottomNavigationBarThemeData buildBottomNavThemeLight(ThemeData base) => BottomNavigationBarThemeData(
  backgroundColor: Color(0xffFEFEFE),
  type: BottomNavigationBarType.fixed,
  showUnselectedLabels: false,
);

BottomNavigationBarThemeData buildBottomNavThemeDark(ThemeData base) => BottomNavigationBarThemeData(
  backgroundColor: Color(0xff121828),
  type: BottomNavigationBarType.fixed,
  showUnselectedLabels: false,
);


