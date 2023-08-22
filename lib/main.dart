import 'package:Counter_Screen_APP/config/theme/app_theme.dart';
import 'package:Counter_Screen_APP/presentation/providers/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/presentation/screens/counter/counter_functions_screen.dart';


void main(){
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    final selectedColor = ref.watch(selectedColorProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkMode: isDarkMode, selectedColor: selectedColor).getTheme(),
      home: const CounterFunctionsScreen()
    );   
  }

}