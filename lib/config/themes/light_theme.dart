import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_fonts.dart';


ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: AppFontSize.s50,
      color: Color(0xff4A4A4A),
      fontWeight: FontWeightManager.bold
    ),
    headline5: TextStyle(
      fontSize: AppFontSize.s34,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    headline6: TextStyle(
      fontSize: AppFontSize.s30,
      color: Color(0xff4A4A4A),
      fontWeight: FontWeightManager.semiBold,
    ),
    bodyText1: TextStyle(
      fontSize: AppFontSize.s24,
      fontWeight: FontWeightManager.semiBold,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
        fontSize: AppFontSize.s20,
        fontWeight: FontWeightManager.semiBold,
        color: Colors.black),
    subtitle1: TextStyle(
        fontSize: AppFontSize.s18,
        fontWeight: FontWeightManager.regular,
        color: Colors.black),
    subtitle2: TextStyle(
      fontSize: AppFontSize.s14,
      fontWeight: FontWeightManager.regular,
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    actionsIconTheme: IconThemeData(color: Colors.black),
    titleSpacing: 20.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark),
  ),
);
