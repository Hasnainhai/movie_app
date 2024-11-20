import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  const SwitchState({this.isSwitch = false, this.slider = 0.1});
  final bool isSwitch;
  final double slider;

  SwitchState copyWith({bool? isSwitch, double? slider}) {
    return SwitchState(
        isSwitch: isSwitch ?? this.isSwitch, slider: slider ?? this.slider);
  }

  @override
  List<Object> get props => [isSwitch, slider];
}
