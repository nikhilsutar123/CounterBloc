import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/bloc/counter_event.dart';
import 'package:counter_bloc/bloc/counter_state.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                state.count.toString(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounterEvent());
                }, child: const Text("plus")),
                ElevatedButton(onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounterEvent());
                }, child: const Text("minus"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
