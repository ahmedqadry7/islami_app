import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.light;

  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  String getBackgroundPath(){
    if(themeMode == ThemeMode.light){
      return "assets/images/bachground.png";
    }
    else{
      return "assets/images/dark_background.png";
    }
  }

  String getBodyOfSebhaPath(){
    if(themeMode == ThemeMode.light){
      return "assets/images/sebha_body.png";
    }
    else{
      return "assets/images/bodyOfSeb7aDark.png";
    }
  }

  String getHeadOfSebhaPath(){
    if(themeMode == ThemeMode.light){
      return "assets/images/sebha_head.png";
    }
    else{
      return "assets/images/headOfSeb7aDark.png";
    }
  }
}
