import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:first_cubit/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MultiBlocProvider(
        child: CounterPage(),
        providers: [
          BlocProvider<CounterCubit>(
            create: (_) => CounterCubit(),
          ),
          BlocProvider<ThemeCubit>(
            create: (_) => ThemeCubit(),
          ),
        ],
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
          style: TextStyle(
            color: color,
          ),
        ),
      ),
      body: Center(
        child: CounterText(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrepemt();
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<ThemeCubit>().swapMode();
            },
            child: Icon(Icons.color_lens),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.watch<CounterCubit>().state;
    return Text('$count', style: theme.textTheme.headline1);
  }
}
