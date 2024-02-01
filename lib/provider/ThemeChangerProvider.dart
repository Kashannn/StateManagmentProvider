import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ThemeChangerProvider with ChangeNotifier{
  bool _isDark = false;
  bool get isDark => _isDark;

  void changeTheme(bool isDark){
    _isDark = isDark;
    notifyListeners();
  }
}