import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {

  String currentLocale = "en";
  ThemeMode currentTheme = ThemeMode.light;
}