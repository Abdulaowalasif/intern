import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../model/categories_model.dart';
import '../../model/slider_lists_model.dart';

part 'category_state.dart';

const String serviceUrl =
    "https://prohandy.xgenious.com/api/v1/service/featured";
const String categoriesUrl = "https://prohandy.xgenious.com/api/v1/categories";
const String providerUrl =
    "https://prohandy.xgenious.com/api/v1/provider-lists";
const String sliderUrl = "https://prohandy.xgenious.com/api/v1/slider-lists";

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());

  // Fetch categories
  Future<void> fetchCategories() async {
    emit(CategoryLoadingState());
    try {
      final response = await http.get(Uri.parse(categoriesUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final CategoryResponse categoryResponse = CategoryResponse.fromJson(data);
        final List<Category> categories = categoryResponse.categories;
        emit(CategoryFetchedSuccessState(categories));
      } else {
        emit(CategoryFetchedErrorState("Failed with status: ${response.statusCode}"));
      }
    } catch (e) {
      emit(CategoryFetchedErrorState("Error: $e"));
    }
  }



}
