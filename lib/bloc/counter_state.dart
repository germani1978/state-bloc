part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int counter;
  const CounterState(this.counter);
}

class CounterCeroState extends CounterState {
  const CounterCeroState() : super(0);
}

class CounterSetState extends CounterState {
  const CounterSetState(int counter) : super(counter);
}