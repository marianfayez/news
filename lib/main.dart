import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/provider/my_provider.dart';
import 'package:news/screens/splash_screen.dart';
import 'package:news/theme/dark_theme.dart';
import 'package:news/theme/light_theme.dart';
import 'package:news/theme/my_theme.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(ChangeNotifierProvider(
    create:(context)=>MyProvider(),
    child: MyApp(
    ),
  ));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    MyTheme light =LightTheme();
    MyTheme dark =DarkTheme();
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: light.themeData,
        darkTheme: dark.themeData,
        themeMode: provider.themeMode,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName:(context)=>SplashScreen()
        },
      ),
    );
  }


}