import 'package:equatable/equatable.dart';

class CounterState extends Equatable {

  final int counter;
  final bool loading;

  const CounterState({
    required this.counter,
    this.loading = false
  });

  CounterState copyWith({
    int? counter,
    bool? loading,
  }) => CounterState(
    counter: counter ?? this.counter,
    loading: loading ?? this.loading
  );

  @override
  List<Object?> get props => [counter, loading];
}