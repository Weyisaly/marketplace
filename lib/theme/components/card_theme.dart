import 'package:flutter/material.dart';

CardTheme buildCardThemeLight(ThemeData base) => CardTheme(
  color: Color(0xff1E293B),
  elevation: 1,
  margin: const EdgeInsets.all(8),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  clipBehavior: Clip.antiAlias,
);

CardTheme buildCardThemeDark(ThemeData base) => CardTheme(
  color: Color(0xffFFFFFF),
  elevation: 1,
  margin: const EdgeInsets.all(8),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  clipBehavior: Clip.antiAlias,
);


