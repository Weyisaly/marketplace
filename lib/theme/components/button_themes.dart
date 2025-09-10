import 'package:flutter/material.dart';
import '../extensions/app_gradients.dart';

ElevatedButtonThemeData buildElevatedButtonThemeLight(ThemeData base) => ElevatedButtonThemeData(
  style: ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 20)),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    textStyle: WidgetStatePropertyAll(base.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, color: Colors.white)),
    foregroundColor: WidgetStatePropertyAll(Colors.white),
    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
    overlayColor: WidgetStatePropertyAll(Colors.white.withOpacity(0.06)),
    side: const WidgetStatePropertyAll(BorderSide(color: Colors.transparent)),
    surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
    shadowColor: const WidgetStatePropertyAll(Colors.transparent),
  ),
);

ElevatedButtonThemeData buildElevatedButtonThemeDark(ThemeData base) => ElevatedButtonThemeData(
  style: ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 20)),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    textStyle: WidgetStatePropertyAll(base.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, color: Colors.white)),
    foregroundColor: WidgetStatePropertyAll(Colors.white),
    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
    overlayColor: WidgetStatePropertyAll(Colors.black.withOpacity(0.06)),
    side: const WidgetStatePropertyAll(BorderSide(color: Colors.transparent)),
    surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
    shadowColor: const WidgetStatePropertyAll(Colors.transparent),
  ),
);

FilledButtonThemeData buildFilledButtonThemeLight(ThemeData base) => FilledButtonThemeData(
  style: FilledButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: base.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
  ),
);

FilledButtonThemeData buildFilledButtonThemeDark(ThemeData base) => FilledButtonThemeData(
  style: FilledButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: base.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
  ),
);

TextButtonThemeData buildTextButtonThemeLight(ThemeData base) => TextButtonThemeData(
  style: TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: base.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
  ),
);

TextButtonThemeData buildTextButtonThemeDark(ThemeData base) => TextButtonThemeData(
  style: TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: base.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
  ),
);

OutlinedButtonThemeData buildOutlinedButtonThemeLight(ThemeData base) => OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    side: BorderSide(color: base.colorScheme.outline),
    textStyle: base.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
  ),
);

OutlinedButtonThemeData buildOutlinedButtonThemeDark(ThemeData base) => OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    side: BorderSide(color: base.colorScheme.outline),
    textStyle: base.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
  ),
);


