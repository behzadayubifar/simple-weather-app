import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/widgets/dot_loading_widget.dart';
import 'package:weather/features/feature_weather/presentation/bloc/home/current_weather_status.dart';
import 'package:weather/features/feature_weather/presentation/bloc/home/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeBloc>(context)
        .add(const LoadCurrentWeatherEvent('Tehran'));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
        child: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.currentWeatherStatus is CurrentWeatherLoading) {
              return Expanded(child: const DotLoadingWidget());
            } else if (state.currentWeatherStatus is CurrentWeatherLoaded) {
              final currentWeatherLoaded =
                  state.currentWeatherStatus as CurrentWeatherLoaded;
              return Column(
                children: [
                  Text(
                    currentWeatherLoaded.currentCityEntity.name.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    currentWeatherLoaded.currentCityEntity.name.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            } else if (state.currentWeatherStatus is CurrrentWeatherError) {
              final currentWeatherError =
                  state.currentWeatherStatus as CurrrentWeatherError;
              return Text(currentWeatherError.message);
            } else {
              return const Text('Unknown Error');
            }
          },
        )
      ],
    )));
  }
}
