part of 'slider_cubit.dart';

@immutable
sealed class SliderState {}

final class SliderInitialState extends SliderState {}

class SliderLoadingState extends SliderState {}

class SliderFetchedSuccessState extends SliderState {
  final List<SliderItem> sliders;

  SliderFetchedSuccessState(this.sliders);
}

class SliderFetchedErrorState extends SliderState {
  final String error;

  SliderFetchedErrorState(this.error);
}
