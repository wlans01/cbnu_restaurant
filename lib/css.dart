import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var css = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      titleTextStyle:
          TextStyle(color: Colors.black87, fontSize: 30, fontFamily: 'BMJUA'),
      iconTheme: IconThemeData(color: Colors.black87, size: 30),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    iconTheme: IconThemeData(size: 30 ,color: Colors.black87),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            primary: Colors.white,
            onPrimary: Colors.redAccent,
            textStyle: TextStyle(
                fontFamily: 'BMJUA', fontSize: 12, color: Colors.black87))),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.redAccent,modalBackgroundColor:  Colors.redAccent),
    fontFamily: 'BMJUA',
    textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 18),
        button: TextStyle(color: Colors.black87)));
