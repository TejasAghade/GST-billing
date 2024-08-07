import 'package:flutter/material.dart';
import 'package:shop_management/core/theme/app_pallet.dart';

class AppTheme{
  static _border({required Color color}) => OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 2
    ),
    borderRadius: BorderRadius.circular(8)
  );

  static ButtonThemeData _buttonThemeData()=> ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    )
  );
  
  static final darkThemeMode = ThemeData.dark().copyWith(
    buttonTheme: _buttonThemeData()
  );
  static final lightThemeMode = ThemeData.light().copyWith(
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(15),
        focusedBorder: _border(color: Pallet.gray),
        enabledBorder: _border(color: Pallet.gray),
        errorBorder: _border(color: Pallet.gray)
      ),
      buttonTheme: _buttonThemeData(),
  );
}