
import 'package:flutter/material.dart';
import 'package:login/themes/dark_mode.dart';
import 'package:login/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Initial light mode
  ThemeData _themeData = lightMode;

  // Get theme
  ThemeData get themeData => _themeData;

  // Is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // Set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    // Update UI
    notifyListeners();
  }

  // Toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
