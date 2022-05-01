import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gg/bloc/counter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text('${state.counter}', style: const TextStyle(fontSize: 80)),
              );
            },
          ),
          floatingActionButton: const Botones(),
        ),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  const Botones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<CounterBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            userBloc.add(AddEvent(2));
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 10),

        FloatingActionButton(
          onPressed: () {
            userBloc.add(DelEvent(2));
          },
          child: const Icon(Icons.remove),
        ),
        const SizedBox(height: 10),

        FloatingActionButton(
          onPressed: () {
            userBloc.add(PonEnCeroEvent());
          },
          child: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
