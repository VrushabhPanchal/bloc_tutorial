part of 'counter_cubit_cubit.dart';

@immutable
sealed class CounterCubitState {}

class CounterState{
  int counterValue;
  bool? wasIncremented;

  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });
}
