import 'package:flutter/material.dart';

TooltipThemeData buildTooltipThemeLight(ThemeData base) => TooltipThemeData(
  decoration: BoxDecoration(
    color: base.colorScheme.inverseSurface,
    borderRadius: BorderRadius.circular(8),
  ),
  textStyle: TextStyle(color: base.colorScheme.onInverseSurface),
);

TooltipThemeData buildTooltipThemeDark(ThemeData base) => TooltipThemeData(
  decoration: BoxDecoration(
    color: base.colorScheme.inverseSurface,
    borderRadius: BorderRadius.circular(8),
  ),
  textStyle: TextStyle(color: base.colorScheme.onInverseSurface),
);


