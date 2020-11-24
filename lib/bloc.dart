import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrepemt() => emit(state - 1);
}

class ThemeCubit extends Cubit<Color> {
  ThemeCubit() : super(Colors.green);

  void swapMode() {
    emit(state == Colors.green ? Colors.red : Colors.green);
    print(state);
  }


}