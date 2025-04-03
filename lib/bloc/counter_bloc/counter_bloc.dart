import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/counter_bloc/counter_event.dart';
import 'package:counter_bloc/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });

    on<DecrementCounterEvent>((event, emit) {
      if(state.count > 0){
        emit(state.copyWith(count: state.count - 1));
      }
    });
  }
}
