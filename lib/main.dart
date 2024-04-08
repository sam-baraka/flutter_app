import 'package:flutter/material.dart';
import 'package:flutter_app/cats_page.dart';
import 'package:flutter_app/cubits/counter_cubit.dart';
import 'package:flutter_app/cubits/get_cats_cubit/get_cats_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CounterCubit(0)),
      BlocProvider(create: (context) => GetCatsCubit())
    ],
    child: const MaterialApp(home: CatsPage()),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(context.watch<CounterCubit>().state.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterCubit>().increase();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
