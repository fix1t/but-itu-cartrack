/// This file contains the theme provider class
/// @Author:  Adam Gabrys xgabry01

import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;

  void updateTheme(ColorScheme colorScheme) {
    _themeData = ThemeData(colorScheme: colorScheme);
    notifyListeners();
  }
}
