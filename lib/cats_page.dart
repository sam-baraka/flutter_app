import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/cubits/counter_cubit.dart';
import 'package:flutter_app/cubits/get_cats_cubit/get_cats_cubit.dart';
import 'package:flutter_app/cubits/get_cats_cubit/get_cats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsPage extends StatelessWidget {
  const CatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cats'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                context.read<GetCatsCubit>().getCats();
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<CounterCubit>().increase();
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () async {
                await withDraw();
                context.read<GetCatsCubit>().getCats();
              },
            ),
          ],
        ),
        body: BlocBuilder<GetCatsCubit, GetCatsState>(
          builder: (context, state) {
            if (state == const GetCatsInitial()) {
              return Container();
            } else if (state == const GetCatsLoading()) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetCatsLoaded) {
              return ListView.builder(
                itemCount: state.cats.length,
                itemBuilder: (context, index) {
                  return Image.network(state.cats[index]['url']);
                },
              );
            } else {
              return const Center(child: Text('Failed to load cats'));
            }
          },
        ));
  }
}

Future<bool> withDraw() async {
  await Future.delayed(const Duration(seconds: 2));
  return true;
}
