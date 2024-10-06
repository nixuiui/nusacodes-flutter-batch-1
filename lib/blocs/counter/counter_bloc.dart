import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/counter/counter_event.dart';
import 'package:flutter_nusacodes/blocs/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc(int initialCounter) : super(const CounterState(counter: 0)) {
    emit(state.copyWith(
      counter: initialCounter
    ));

    on<IncrementEvent>((event, emit) {
      emit(state.copyWith(
        counter: state.counter + 1,
      ));
    });

    on<DecrementEvent>((event, emit) {
      emit(state.copyWith(
        counter: state.counter - 1,
      ));
    });
  }

}