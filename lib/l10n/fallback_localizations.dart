import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Fallback for Material localizations when a locale isn't supported by Flutter.
class FallbackMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationsDelegate({this.fallbackLocale = const Locale('en')});

  final Locale fallbackLocale;

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tk';

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    return GlobalMaterialLocalizations.delegate.load(fallbackLocale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<MaterialLocalizations> old) => false;
}

/// Fallback for Cupertino localizations when a locale isn't supported by Flutter.
class FallbackCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate({this.fallbackLocale = const Locale('en')});

  final Locale fallbackLocale;

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tk';

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return GlobalCupertinoLocalizations.delegate.load(fallbackLocale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<CupertinoLocalizations> old) => false;
}

/// Fallback for Widgets localizations when a locale isn't supported by Flutter.
class FallbackWidgetsLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const FallbackWidgetsLocalizationsDelegate({this.fallbackLocale = const Locale('en')});

  final Locale fallbackLocale;

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tk';

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    return GlobalWidgetsLocalizations.delegate.load(fallbackLocale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<WidgetsLocalizations> old) => false;
}


