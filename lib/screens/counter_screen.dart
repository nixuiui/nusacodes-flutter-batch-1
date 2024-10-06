import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/counter/counter_bloc.dart';
import 'package:flutter_nusacodes/blocs/counter/counter_cubit.dart';
import 'package:flutter_nusacodes/blocs/counter/counter_event.dart';
import 'package:flutter_nusacodes/blocs/counter/counter_state.dart';
import 'package:flutter_nusacodes/getx/counter_controller.dart';
import 'package:flutter_nusacodes/providers/counter_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  final controller = CounterController();
  final counterBloc = CounterBloc();
  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              "Get: ${controller.counter.value}",
              style: const TextStyle(
                fontSize: 40,
              ),
            )),
            Consumer<CounterModel>(
              builder: (context, state, child) {
                return Text(
                  "Provider: ${state.counter}",
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                );
              }
            ),
            BlocBuilder<CounterCubit, CounterState>(
              bloc: counterCubit,
              builder: (context, state) {
                return Text(
                  "Cubit: ${state.counter}",
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                );
              }
            ),
            BlocBuilder<CounterBloc, CounterState>(
              bloc: counterBloc,
              builder: (context, state) {
                return Text(
                  "Bloc: ${state.counter}",
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                );
              }
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(IncrementEvent());
          counterCubit.increment();
          context.read<CounterModel>().increment();
          controller.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}