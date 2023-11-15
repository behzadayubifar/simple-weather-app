import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/widgets/main_wrapper.dart';
import 'package:weather/features/feature_weather/presentation/bloc/home/home_bloc.dart';
import 'package:weather/locator.dart';

void main(List<String> args) async {
  await setup();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => locator<HomeBloc>()),
    ],
    child: MaterialApp(
      home: MainWrapper(),
    ),
  ));
}
