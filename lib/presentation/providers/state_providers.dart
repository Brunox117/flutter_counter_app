import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'state_providers.g.dart';
@riverpod
class Counter extends _$Counter{
  @override
  int build() => 0;

  void increaseByOne(){
    state++;
  }

  void decreaseByOne(){
    state--;
  }

  void equalToZero(){
    state = 0;
  }
}

@riverpod
class DarkMode extends _$DarkMode{
  @override 
  bool build() => false;

  void toggleDarkMode(){
    state = !state;
  }
}

@riverpod
class SelectedColor extends _$SelectedColor{
  @override
  Color build() => Color(Colors.blue.value);

  void changeSelectedColor(Color color){
    state = color;
  }
}