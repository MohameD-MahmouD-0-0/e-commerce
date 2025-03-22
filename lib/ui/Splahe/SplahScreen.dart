import 'dart:async';
import 'package:ecommerce/ui/authe/register/register.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashScreen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed(RegisterScreen.routeName);
    });
    return Scaffold(
        body: Image.asset(
      'assets/images/Splash Screen.png',
          fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ));
  }
}
