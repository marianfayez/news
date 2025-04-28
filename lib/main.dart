import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:news/internet_service.dart';
import 'package:news/models/sources_model.dart';
import 'package:news/provider/my_provider.dart';
import 'package:news/screens/splash_screen.dart';
import 'package:news/theme/dark_theme.dart';
import 'package:news/theme/light_theme.dart';
import 'package:news/theme/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/bloc_observer.dart';
import 'models/news_model.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  InternetService().init();
  await Hive.initFlutter();
  Hive.registerAdapter(NewsModelAdapter());
  Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(SourcesAdapter());
  Hive.registerAdapter(SourcesModelAdapter());

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