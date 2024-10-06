import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  CounterCubit(int initialCounter) : super(const CounterState(counter: 0)) {
    emit(state.copyWith(counter: initialCounter));
  }

  void increment() => emit(state.copyWith(
    counter: state.counter + 1,
  ));
  
  void decrement() => emit(state.copyWith(
    counter: state.counter - 1,
  ));

}