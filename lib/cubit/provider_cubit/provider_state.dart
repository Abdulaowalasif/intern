part of 'provider_cubit.dart';

@immutable
abstract class ProviderState {}

class ProviderInitialState extends ProviderState {}

class ProviderLoadingState extends ProviderState {}

class ProviderFetchedSuccessState extends ProviderState {
  final List<Provider> providers;

  ProviderFetchedSuccessState(this.providers);
}

class ProviderFetchedErrorState extends ProviderState {
  final String error;

  ProviderFetchedErrorState(this.error);
}
