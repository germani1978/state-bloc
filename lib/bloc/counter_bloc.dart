import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterCeroState()) {

    on<PonEnCeroEvent>((event, emit) { emit( const CounterCeroState() ); });

    on<AddEvent>((event, emit) {

       emit( CounterSetState( state.counter + event.suma ) );
    });

    on<DelEvent>((event, emit) {

       if (state.counter <= 0) return;

       emit( CounterSetState( state.counter - event.resta ) );

    });

  }
}
