import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import '../../model/provider_lists_model.dart';

part 'provider_state.dart';

const String providerUrl =
    "https://prohandy.xgenious.com/api/v1/provider-lists";

class ProviderCubit extends Cubit<ProviderState> {
  ProviderCubit() : super(ProviderInitialState());

  Future<void> fetchProviders() async {
    emit(ProviderLoadingState());
    try {
      final response = await http.get(Uri.parse(providerUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final providerListResponse = ProviderListResponse.fromJson(data);
        final List<Provider> providers = providerListResponse.providerLists;

        emit(ProviderFetchedSuccessState(providers));
      } else {
        emit(
          ProviderFetchedErrorState(
            "Failed with status: ${response.statusCode}",
          ),
        );
      }
    } catch (e) {
      emit(ProviderFetchedErrorState("Error: $e"));
    }
  }
}
