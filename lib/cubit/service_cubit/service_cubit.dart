import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../model/services_model.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitialState());

  static const String serviceUrl =
      "https://prohandy.xgenious.com/api/v1/service/featured";

  Future<void> fetchServices() async {
    emit(ServiceLoadingState());
    try {
      final response = await http.get(Uri.parse(serviceUrl));
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);

        final ServiceResponse serviceResponse = ServiceResponse.fromJson(
          jsonBody,
        );

        emit(ServiceFetchedSuccessState(serviceResponse.allServices));
      } else {
        emit(ServiceFetchedErrorState("Failed: ${response.statusCode}"));
      }
    } catch (e) {
      emit(ServiceFetchedErrorState("Exception: $e"));
    }
  }
}
