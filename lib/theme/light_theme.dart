import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:news/theme/my_theme.dart';

class DarkTheme extends MyTheme{
  @override
  Color get backgroundColor => Color(0xFF171717);

  @override
  Color get primaryColor => Color(0xFFFFFFFF);

  @override
  ThemeData get themeData => ThemeData(
    primaryColor: primaryColor,
    secondaryHeaderColor: backgroundColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(color: backgroundColor,centerTitle: true),
    textTheme:TextTheme(
      titleLarge:TextStyle(fontWeight: FontWeight.w500,fontSize: 24,color: primaryColor),
      titleMedium:TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: primaryColor),
      titleSmall:TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: primaryColor),

    )

  );


}