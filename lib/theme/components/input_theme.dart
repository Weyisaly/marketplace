import 'package:flutter/material.dart';

InputDecorationTheme buildInputDecorationThemeLight(ThemeData base) => InputDecorationTheme(
  filled: true,
  fillColor: Color(0xffF8FAFC),
  prefixIconColor: Color(0xff94A3B8),
  suffixIconColor: Color(0xff94A3B8),
  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Color(0xffE2E8F0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Color(0xffE2E8F0), width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: base.colorScheme.error),
  ),
  hintStyle: base.textTheme.bodyMedium?.copyWith(color: base.colorScheme.onSurfaceVariant),
  labelStyle: base.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
);

InputDecorationTheme buildInputDecorationThemeDark(ThemeData base) => InputDecorationTheme(
  filled: true,
  fillColor: Color(0xff1E293B),
  prefixIconColor: Color(0xff94A3B8),
  suffixIconColor: Color(0xff94A3B8),
  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Color(0xff334155)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Color(0xff334155), width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: base.colorScheme.error),
  ),
  hintStyle: base.textTheme.bodyMedium?.copyWith(color: Color(0xff94A3B8)),
  labelStyle: base.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
);


