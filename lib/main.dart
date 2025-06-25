import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern/cubit/category_cubit/category_cubit.dart';
import 'package:intern/cubit/provider_cubit/provider_cubit.dart';
import 'package:intern/cubit/service_cubit/service_cubit.dart';
import 'package:intern/screens/home_screen.dart';

import 'cubit/slider_cubit/slider_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoryCubit()),
        BlocProvider(create: (_) => SliderCubit()),
        BlocProvider(create: (_) => ProviderCubit()),
        BlocProvider(create: (_) => ServiceCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
