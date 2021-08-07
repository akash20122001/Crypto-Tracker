import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Screens/marketValueScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        nextScreen: MyHomePage(),
        splash: Image.asset("assets/SplashScreenIcon.png"),
        backgroundColor: Color(0xFF0D0C18),
      )
    );
  }
}
