import 'package:counter_bloc/bloc/switch_bloc/switch_bloc.dart';
import 'package:counter_bloc/bloc/switch_bloc/switch_event.dart';
import 'package:counter_bloc/bloc/switch_bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("notifications"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isToggled != current.isToggled,
                  builder: (BuildContext context, state) {
                    print("notification");
                    return Switch(
                        value: state.isToggled,
                        onChanged: (newVal) {
                          context.read<SwitchBloc>().add(ToggleSwitch());
                        });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Container(
                height: 100,
                color: Colors.deepOrange.withOpacity(state.sliderVal),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.sliderVal != current.sliderVal,
                builder: (context, state) {
                  print("slider");
                  return Slider(
                      value: state.sliderVal,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(SliderEvent(slider: value));
                      });
                })
          ],
        ),
      ),
    );
  }
}
