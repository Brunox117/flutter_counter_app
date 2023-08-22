import 'package:Counter_Screen_APP/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/presentation/screens/counter/counter_functions_screen.dart';


void main(){
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const CounterFunctionsScreen()
    );   
  }

}