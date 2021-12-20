import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_provider/utils/themes/m_colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: MColors.mdViolet,
    fontFamily: 'Montserrat',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
        color: Colors.white, fontSize: 48.sp, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        color: Colors.white, fontSize: 34.sp, fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
        color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
  );
}
