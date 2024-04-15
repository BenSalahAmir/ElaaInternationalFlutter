import 'package:flutter/material.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';


class MedicaMythemes {
  static final lightTheme = ThemeData(

    primaryColor: Medicacolor.primary,
    primarySwatch: Colors.grey,
    textTheme: const TextTheme(),
    fontFamily: 'UrbanistRegular',
    scaffoldBackgroundColor: Medicacolor.white,
    appBarTheme: AppBarTheme(
      iconTheme:  const IconThemeData(color: Medicacolor.black),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: urbanistRegular.copyWith(
        color: Medicacolor.black,
        fontSize: 16,
      ),
      color: Medicacolor.transparent,
    ),
  );

  static final darkTheme = ThemeData(

    fontFamily: 'UrbanistRegular',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Medicacolor.black,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Medicacolor.white),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: urbanistRegular.copyWith(
        color: Medicacolor.white,
        fontSize: 15,
      ),
      color: Medicacolor.transparent,
    ),
  );
}