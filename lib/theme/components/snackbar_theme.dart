import 'package:flutter/material.dart';

SnackBarThemeData buildSnackBarThemeLight(ThemeData base) => SnackBarThemeData(
  behavior: SnackBarBehavior.floating,
  backgroundColor: base.colorScheme.inverseSurface,
  contentTextStyle: TextStyle(color: base.colorScheme.onInverseSurface),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);

SnackBarThemeData buildSnackBarThemeDark(ThemeData base) => SnackBarThemeData(
  behavior: SnackBarBehavior.floating,
  backgroundColor: base.colorScheme.inverseSurface,
  contentTextStyle: TextStyle(color: base.colorScheme.onInverseSurface),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);


