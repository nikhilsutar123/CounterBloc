import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  bool isToggled;
  double sliderVal;

  SwitchState({this.isToggled = false, this.sliderVal = 1.0});

  SwitchState copyWith({bool? isToggle, double? slider}) {
    return SwitchState(
        isToggled: isToggle ?? isToggled, sliderVal: slider ?? sliderVal);
  }

  @override
  List<Object?> get props => [isToggled, sliderVal];
}
