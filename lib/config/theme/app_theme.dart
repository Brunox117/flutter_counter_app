import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.pink,
  Colors.deepPurple,
  Colors.orange,
];

class AppTheme{
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = 0})
          : assert(selectedColor >= 0, 'Selected color must be greater than zero'),
            assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length-1}');
  
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(centerTitle: false),
  );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
  
}
