import 'package:bloc_poc/bloc/counter/counter_event.dart';
import 'package:bloc_poc/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<Increment>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });

    on<Decrement>((event, emit) {
      emit(state.copyWith(count: state.count - 1));
    });
  }
}
