import 'dart:ui';

class SystemConstants {
  // Locale
  static const String localePath = 'assets/localization/';
  static const List<Locale> supportedLocales = [
    Locale('en', 'GB'),
    Locale('es', 'ES'),
    Locale('uk', 'UA'),
  ];
  static const Locale fallbackLocale = Locale('en', 'GB');

  // Networking
  static const Duration connectTimeout = Duration(seconds: 36);
  static const Duration receiveTimeout = Duration(seconds: 36);
}
