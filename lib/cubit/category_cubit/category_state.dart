part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

// Category states
class CategoryLoadingState extends CategoryState {}

class CategoryFetchedSuccessState extends CategoryState {
  final List<Category> categories;

  CategoryFetchedSuccessState(this.categories);
}


class CategoryFetchedErrorState extends CategoryState {
  final String error;

  CategoryFetchedErrorState(this.error);
}



