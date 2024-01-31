import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperhub/views/home.dart';
import 'package:page_transition/page_transition.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallpaperHub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:AnimatedSplashScreen(
    splash: Column(
    children: [
      Image.asset('assets/img1.png'),

    ],
    ),
    backgroundColor: Colors.white,
    nextScreen: Home(),
    splashIconSize: 250,
        duration: 2000,
        splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        animationDuration: Duration(seconds: 1),

    ),
    );
  }
}

