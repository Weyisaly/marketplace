import 'package:flutter/material.dart';

CheckboxThemeData buildCheckboxThemeLight(ThemeData base) => CheckboxThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  side: BorderSide(color: base.colorScheme.outlineVariant),
);

CheckboxThemeData buildCheckboxThemeDark(ThemeData base) => CheckboxThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  side: BorderSide(color: base.colorScheme.outlineVariant),
);

RadioThemeData buildRadioThemeLight(ThemeData base) => const RadioThemeData();

RadioThemeData buildRadioThemeDark(ThemeData base) => const RadioThemeData();

SwitchThemeData buildSwitchThemeLight(ThemeData base) => const SwitchThemeData();

SwitchThemeData buildSwitchThemeDark(ThemeData base) => const SwitchThemeData();


