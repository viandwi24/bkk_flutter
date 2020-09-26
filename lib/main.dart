import 'package:flutter/material.dart';
import 'package:bkk/constants.dart';
import 'package:bkk/screens/welcome/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'BKK SKANESA',
    theme: ThemeData(
      fontFamily: 'Raleway',
      primaryColor: kColorPrimary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: kColorText),
        bodyText2: TextStyle(color: kColorText)
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity
    ),
    home: WelcomeScreen(),
  ));
}