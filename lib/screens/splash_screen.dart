import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // Start a timer for 3 seconds
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset("assets/images/splash_logo.png"),
            Spacer(),
            Image.asset("assets/images/branding.png"),
            Text("Supervised by Mohamed Nabil",style: Theme.of(context).textTheme.titleSmall,)

          ],
        ),
      ),
    );
  }
}
