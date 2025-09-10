import 'package:flutter/material.dart';

AppBarTheme buildAppBarThemeLight(ThemeData base) => AppBarTheme(
  backgroundColor: const Color(0xffFFFFFF),
  elevation: 4,
  scrolledUnderElevation: 4,
  titleTextStyle: base.textTheme.titleMedium?.copyWith(
    fontWeight: FontWeight.w600,
    color: base.colorScheme.onSurface,
  ),
  iconTheme: IconThemeData(color: base.colorScheme.onSurface),
  actionsIconTheme: IconThemeData(color: base.colorScheme.onSurface),
);

AppBarTheme buildAppBarThemeDark(ThemeData base) => AppBarTheme(
  backgroundColor: const Color(0xff121828),
  elevation: 4,
  scrolledUnderElevation: 4,
  titleTextStyle: base.textTheme.titleMedium?.copyWith(
    fontWeight: FontWeight.w600,
    color: base.colorScheme.onSurface,
  ),
  iconTheme: IconThemeData(color: base.colorScheme.onSurface),
  actionsIconTheme: IconThemeData(color: base.colorScheme.onSurface),
);



