import 'package:bloc_movie_app/bloc/counteBloc/counter_bloc.dart';
import 'package:bloc_movie_app/bloc/counteBloc/counter_event.dart';
import 'package:bloc_movie_app/bloc/counteBloc/counter_state.dart';
import 'package:bloc_movie_app/ui/posts/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;
  @override
  void initState() {
    _counterBloc = CounterBloc();
    super.initState();
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('counter example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostScreen()));
                },
                child: const Text('Next')),
            BlocBuilder<CounterBloc, CounterState>(
                buildWhen: (current, previous) =>
                    current != previous ? true : false,
                builder: (context, state) {
                  return Center(
                    child: Text(
                      state.count.toString(),
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                  return Center(
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementCounter());
                        },
                        child: const Text('increament')),
                  );
                }),
                const SizedBox(width: 20),
                BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                  return Center(
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementCounter());
                        },
                        child: const Text('decrement')),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
