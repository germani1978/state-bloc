part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class PonEnCeroEvent extends CounterEvent {}

class AddEvent extends CounterEvent {
  final int suma;
  AddEvent(this.suma);
}

class DelEvent extends CounterEvent {
  final int resta;
  DelEvent(this.resta);
}
