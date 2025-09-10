import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale? _locale;

  ThemeProvider() {
    _loadSettings();
  }

  ThemeMode get themeMode => _themeMode;
  Locale? get locale => _locale;

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('themeMode');
    final localeCode = prefs.getString('localeCode');
    
    _themeMode = _parseThemeMode(themeString) ?? ThemeMode.system;
    _locale = localeCode != null ? Locale(localeCode) : null;
    notifyListeners();
  }

  ThemeMode? _parseThemeMode(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
    }
    return null;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'themeMode',
      mode == ThemeMode.light ? 'light' : mode == ThemeMode.dark ? 'dark' : 'system',
    );
    _themeMode = mode;
    notifyListeners();
  }

  Future<void> setLocale(Locale? locale) async {
    if (_locale == locale) return;
    
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove('localeCode');
    } else {
      await prefs.setString('localeCode', locale.languageCode);
    }
    _locale = locale;
    notifyListeners();
  }
}