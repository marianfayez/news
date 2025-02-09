import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  ThemeMode themeMode=ThemeMode.light;

  List<String> lightThemeList =
  ["general_light", 'business_light', 'sports_light','technology_light','entertainment_light','health_light','science_light'];
  List<String> darkThemeList =
  ['general_dark', 'business_dark', 'sports_dark','technology_dark','entertainment_dark','health_dark','science_dark'];

  List<String> get currentList {
    return themeMode == ThemeMode.light ? lightThemeList : darkThemeList;
  }

  void changeTheme(){
    if(themeMode==ThemeMode.light){
      themeMode=ThemeMode.dark;
    }else{
      themeMode=ThemeMode.light;
    }
    notifyListeners();
  }

  void themeLight(){
    themeMode=ThemeMode.light;
    notifyListeners();
  }
  void themeDark(){
    themeMode=ThemeMode.dark;
    notifyListeners();
  }
}