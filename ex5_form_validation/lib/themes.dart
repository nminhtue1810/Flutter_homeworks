import 'package:flutter/material.dart';

final ThemeData lTheme = _buildLightTheme();
final ThemeData dTheme = _buildDartTheme();

ThemeData _buildLightTheme(){
  return ThemeData(
    brightness: Brightness.light,

  );
}

ThemeData _buildDartTheme(){
  return ThemeData();
}