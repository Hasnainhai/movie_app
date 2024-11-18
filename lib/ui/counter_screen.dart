import 'package:bloc_movie_app/bloc/counter_bloc.dart';
import 'package:bloc_movie_app/bloc/counter_event.dart';
import 'package:bloc_movie_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Center(
              child: Text(
                state.count.toString(),
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: const Text('increament')),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: const Text('decrement')),
            ],
          ),
        ],
      ),
    );
  }
}
