part of 'counter_cubit_cubit.dart';

@immutable
sealed class CounterCubitState {}

class CounterState extends Equatable{
  final int counterValue;
  final bool? wasIncremented;

  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.counterValue,this.wasIncremented];
}
