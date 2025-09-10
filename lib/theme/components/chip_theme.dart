import 'package:flutter/material.dart';

ChipThemeData buildChipThemeLight(ThemeData base) => base.chipTheme.copyWith(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  labelStyle: base.textTheme.labelLarge,
);

ChipThemeData buildChipThemeDark(ThemeData base) => base.chipTheme.copyWith(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  labelStyle: base.textTheme.labelLarge,
);


