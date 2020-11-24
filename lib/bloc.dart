import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrepemt() => emit(state - 1);
}

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void swapMode() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
