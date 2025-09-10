import 'package:elimde/theme/extensions/container_gradient.dart';
import 'package:flutter/material.dart';
import 'components/app_bar_theme.dart';
import 'components/button_themes.dart';
import 'components/input_theme.dart';
import 'components/card_theme.dart';
import 'components/snackbar_theme.dart';
import 'components/bottom_nav_theme.dart';
import 'components/chip_theme.dart';
import 'components/dialog_theme.dart';
import 'components/list_tile_theme.dart';
import 'components/tooltip_theme.dart';
import 'components/divider_theme.dart';
import 'components/checkbox_radio_switch.dart';
import 'extensions/app_gradients.dart';

class AppTheme {
  static ThemeData light() {
    final base = ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0276ff), brightness: Brightness.light, surface: Color(0xffFFFFFF), outline: Color(0xffE2E8F0)),
      useMaterial3: true,
    );
    return base.copyWith(
      extensions: <ThemeExtension<dynamic>>[
        AppGradients.light(base.colorScheme),
        ContainerGradients.light(base.colorScheme),
      ],
      appBarTheme: buildAppBarThemeLight(base),
      scaffoldBackgroundColor: Color(0xffFFFFFF),
      cardTheme: buildCardThemeLight(base),
      elevatedButtonTheme: buildElevatedButtonThemeLight(base),
      filledButtonTheme: buildFilledButtonThemeLight(base),
      textButtonTheme: buildTextButtonThemeLight(base),
      outlinedButtonTheme: buildOutlinedButtonThemeLight(base),
      inputDecorationTheme: buildInputDecorationThemeLight(base),
      chipTheme: buildChipThemeLight(base),
      listTileTheme: buildListTileThemeLight(base),
      snackBarTheme: buildSnackBarThemeLight(base),
      dialogTheme: buildDialogThemeLight(base),
      bottomNavigationBarTheme: buildBottomNavThemeLight(base),
      checkboxTheme: buildCheckboxThemeLight(base),
      radioTheme: buildRadioThemeLight(base),
      switchTheme: buildSwitchThemeLight(base),
      dividerTheme: buildDividerThemeLight(base),
      tooltipTheme: buildTooltipThemeLight(base),
    );
  }

  static ThemeData dark() {
    final base = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0276ff), brightness: Brightness.dark, surface: Color(0xff1E293B), outline: Color(0xff334155)),
      useMaterial3: true,
    );
    return base.copyWith(
      extensions: <ThemeExtension<dynamic>>[
        AppGradients.dark(base.colorScheme),
        ContainerGradients.dark(base.colorScheme),
      ],
      appBarTheme: buildAppBarThemeDark(base),
      scaffoldBackgroundColor: Color(0xff172133),
      cardTheme: buildCardThemeDark(base),
      elevatedButtonTheme: buildElevatedButtonThemeDark(base),
      filledButtonTheme: buildFilledButtonThemeDark(base),
      textButtonTheme: buildTextButtonThemeDark(base),
      outlinedButtonTheme: buildOutlinedButtonThemeDark(base),
      inputDecorationTheme: buildInputDecorationThemeDark(base),
      chipTheme: buildChipThemeDark(base),
      listTileTheme: buildListTileThemeDark(base),
      snackBarTheme: buildSnackBarThemeDark(base),
      dialogTheme: buildDialogThemeDark(base),
      bottomNavigationBarTheme: buildBottomNavThemeDark(base),
      checkboxTheme: buildCheckboxThemeDark(base),
      radioTheme: buildRadioThemeDark(base),
      switchTheme: buildSwitchThemeDark(base),
      dividerTheme: buildDividerThemeDark(base),
      tooltipTheme: buildTooltipThemeDark(base),
    );
  }
}


