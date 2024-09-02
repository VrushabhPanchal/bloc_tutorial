import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_tutorial/cubit/counter_cubit_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("counterCubit", () {
    CounterCubit counterCubit = CounterCubit();

    setUp(
      () {
        counterCubit = CounterCubit();
      },
    );
    tearDown(
      () {
        counterCubit.close();
      },
    );

    test(
      "the initial state for the Counter Cubit is Counterstate ( countervalue : 0 )",
      () {
        expect(counterCubit.state, CounterState(counterValue: 0));
      },
    );
    blocTest(
      "this cubit should emit a CounterState ( counterValue : 1, wasIncremented : true ) when cubit.increment() function is called",
      build: () => counterCubit,
      act: (cubit) => counterCubit.increment() ,
      expect: () => [CounterState(counterValue: 1 ,wasIncremented: true)],
    );
    blocTest(
      "this cubit should emit a CounterState ( counterValue : -1, wasIncremented : false ) when cubit.decrement() function is called",
      build: () => counterCubit,
      act: (cubit) => counterCubit.decrement() ,
      expect: () => [CounterState(counterValue: -1 ,wasIncremented: false)],
    );
  });
}
