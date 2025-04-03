import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/switch_bloc/switch_event.dart';
import 'package:counter_bloc/bloc/switch_bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<ToggleSwitch>(_toggleSwitch);
    on<SliderEvent>(_slider);
  }

  void _toggleSwitch(ToggleSwitch event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isToggle: !state.isToggled));
  }

  void _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
