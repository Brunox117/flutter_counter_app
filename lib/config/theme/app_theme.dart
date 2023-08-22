import 'package:flutter/material.dart';

class AppTheme{
  final Color selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = Colors.blue});
  
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: selectedColor,
    appBarTheme: const AppBarTheme(centerTitle: false),
  );

  AppTheme copyWith({Color? selectedColor, bool? isDarkMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
  
}
