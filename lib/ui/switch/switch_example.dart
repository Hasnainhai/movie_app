import 'package:bloc_movie_app/bloc/switchBloc/switch_bloc.dart';
import 'package:bloc_movie_app/bloc/switchBloc/switch_event.dart';
import 'package:bloc_movie_app/bloc/switchBloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example tw0'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (current, previous) =>
                        current.isSwitch != previous.isSwitch,
                    builder: (context, state) {
                      return Switch(
                          value: state.isSwitch,
                          onChanged: (value) {
                            context
                                .read<SwitchBloc>()
                                .add(EnableDisableSwitch());
                          });
                    }),
              ],
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Container(
                height: 200,
                width: double.infinity,
                color: Colors.red.withOpacity(state.slider),
              );
            }),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (current, previous) =>
                    current.slider != previous.slider,
                builder: (context, state) {
                  return Slider(
                      value: state.slider,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(SliderEvent(slider: value));
                      });
                }),
          ],
        ),
      ),
    );
  }
}
