import 'package:bloc/bloc.dart';
import 'package:bloc_movie_app/bloc/switchBloc/switch_event.dart';
import 'package:bloc_movie_app/bloc/switchBloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableDisableSwitch>(_enableDisableSwitch);
    on<SliderEvent>(_enableSlider);
  }

  void _enableDisableSwitch(
      EnableDisableSwitch event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _enableSlider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
