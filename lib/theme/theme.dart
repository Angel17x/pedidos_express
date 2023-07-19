import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:pedidos_express/models/theme_model.dart';
import 'package:pedidos_express/styles/color.dart';

final _logger = Logger();


class ExpressTheme extends ChangeNotifier {
  String fontFamily = 'Poppins';
  
  Future<ThemeData> get getTheme async {
    var themeColor = await _getThemeColor;

    return ThemeData(
        primaryColor: Color(themeColor?.colors?.primary ?? 0),
        secondaryHeaderColor: Color(themeColor?.colors?.secondary ?? 0),
        cardTheme: CardTheme(
          color: Color(themeColor?.colors?.secondary ?? 0),
          elevation: 0
        ),
        fontFamily: this.fontFamily,
        cardColor: Color(themeColor?.colors?.secondary ?? 0),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(themeColor?.colors?.secondary ?? 0)),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Color(themeColor?.colors?.primary ?? 0)
        ),
        navigationBarTheme: NavigationBarThemeData(
          height: 50,
          backgroundColor: Color(themeColor?.colors?.primary ?? 0),
          surfaceTintColor: ColorUtil.warning,
          elevation: 0,
          indicatorColor: Color(themeColor?.colors?.primaryLight ?? 0),
          indicatorShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          labelTextStyle: MaterialStateTextStyle.resolveWith(
                  (states) => TextStyle(fontSize: 10, color: Color(themeColor?.colors?.secondary ?? 0))),
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return IconThemeData(color: Color(themeColor?.colors?.secondary ?? 0), size: 25);
            }
            return IconThemeData(color: ColorUtil.gray, size: 25);
          }),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(

          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Color(themeColor?.colors?.primary ?? 0)),
          foregroundColor: MaterialStateProperty.all<Color>(ColorUtil.white),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(fontSize: 16, fontFamily: this.fontFamily),
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 16,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        bodyLarge: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 20,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        bodySmall: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 14,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        displaySmall: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 14,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        displayLarge: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 20,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        displayMedium: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 16,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        labelSmall: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 14,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        labelLarge: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 20,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        labelMedium: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 16,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        titleSmall: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 14,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        titleLarge: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 20,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),
        titleMedium: TextStyle(
          fontFamily: this.fontFamily,
          fontSize: 16,
          color: Color(themeColor?.colors?.primary ?? 0),
        ),

      ),
      primaryColorLight: Color(themeColor?.colors?.primaryLight ?? 0),
      scaffoldBackgroundColor: Color(themeColor?.colors?.bgLight ?? 0),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: ColorUtil.gray,
        selectionHandleColor: Color(themeColor?.colors?.primaryLight ?? 0),
        cursorColor: Color(themeColor?.colors?.primaryLight ?? 0)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Color(themeColor?.colors?.primary ?? 0)),
          foregroundColor: MaterialStateProperty.all<Color>(ColorUtil.white),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(fontSize: 16, fontFamily: this.fontFamily),
          ),
        ),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
       color: Color(themeColor?.colors?.primary ?? 0),
      ),
      primaryIconTheme: IconThemeData(
        color: Color(themeColor?.colors?.primary ?? 0)
      ),
      inputDecorationTheme: InputDecorationTheme(
        suffixStyle: TextStyle(color: Color(themeColor?.colors?.primary ?? 0)),
        prefixStyle: TextStyle(color: Color(themeColor?.colors?.primary ?? 0)),
        suffixIconColor: Color(themeColor?.colors?.primary ?? 0),
        prefixIconColor: Color(themeColor?.colors?.primary ?? 0),
        labelStyle: TextStyle(color: ColorUtil.secondary_light),
        hintStyle: TextStyle(
          fontFamily: this.fontFamily,
          color: ColorUtil.gray
        ),
        focusColor: ColorUtil.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: 2, color: ColorUtil.transparent),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorUtil.transparent),
            borderRadius: BorderRadius.circular(25)
        ),
        iconColor: Color(themeColor?.colors?.primaryLight ?? 0),
        fillColor: Color(themeColor?.colors?.primaryLight ?? 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: 2, color: ColorUtil.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: 0, color: ColorUtil.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: 0, color: ColorUtil.transparent),
        ),
      ),
      iconTheme: IconThemeData(
        color: Color(themeColor?.colors?.primary ?? 0),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(Color(themeColor?.colors?.primary ?? 0)),
              iconColor:
              MaterialStateProperty.all(Color(themeColor?.colors?.primaryLight ?? 0)))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(themeColor?.colors?.secondary ?? 0),
        selectedItemColor: Color(themeColor?.colors?.primary ?? 0),
      )

    );
  }

  static Future<ThemeColorJson?> get _getThemeColor async {
    var data = await rootBundle.loadString('assets/theme_data/theme.json');
    if(data!=null){
      var result = jsonDecode(data);
      return ThemeColorJson.fromJson(result);
    }
    return null;
  }
}

