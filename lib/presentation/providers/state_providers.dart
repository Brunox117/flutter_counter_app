import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'state_providers.g.dart';
@riverpod
class Counter extends _$Counter{
  @override
  int build() => 6;

  void increaseByOne(){
    state++;
  }
}