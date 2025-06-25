part of 'service_cubit.dart';

@immutable
abstract class ServiceState {}

class ServiceInitialState extends ServiceState {}

class ServiceLoadingState extends ServiceState {}

class ServiceFetchedSuccessState extends ServiceState {
  final List<Service> services;
  ServiceFetchedSuccessState(this.services);
}

class ServiceFetchedErrorState extends ServiceState {
  final String error;
  ServiceFetchedErrorState(this.error);
}
