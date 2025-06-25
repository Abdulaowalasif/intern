import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/slider_lists_model.dart';
import 'package:http/http.dart' as http;

import '../category_cubit/category_cubit.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitialState());

  // Fetch slider list
  Future<void> fetchSliders() async {
    emit(SliderLoadingState());
    try {
      final response = await http.get(Uri.parse(sliderUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final SliderResponse sliderResponse = SliderResponse.fromJson(data);
        final List<SliderItem> sliders = sliderResponse.sliders;
        emit(SliderFetchedSuccessState(sliders));
      } else {
        emit(
          SliderFetchedErrorState("Failed with status: ${response.statusCode}"),
        );
      }
    } catch (e) {
      emit(SliderFetchedErrorState("Error: $e"));
    }
  }
}
