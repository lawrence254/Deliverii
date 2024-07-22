import 'package:delifood/themes/theme_dark.dart';
import 'package:delifood/themes/theme_light.dart';
import 'package:flutter/material.dart';

//Helper to switch from light to dark mode

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;

   ThemeData get themeData => _themeData;

   bool get isDarkMode =>_themeData == darkMode;

   set themeData(ThemeData themeData){
     _themeData = themeData;
     notifyListeners();
   }
  void toggleTheme(){
       _themeData == lightMode ? themeData=darkMode : themeData=lightMode;
  }
}