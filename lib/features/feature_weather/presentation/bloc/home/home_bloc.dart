import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather/features/feature_weather/presentation/bloc/home/current_weather_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  HomeBloc(this.getCurrentWeatherUsecase)
      : super(HomeState(currentWeatherStatus: CurrentWeatherLoading())) {
    on<LoadCurrentWeatherEvent>((event, emit) async {
      emit(state.copyWith(newCurrentWeatherStatus: CurrentWeatherLoading()));

      DataState dataState = await getCurrentWeatherUsecase(event.cityName);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newCurrentWeatherStatus: CurrentWeatherLoaded(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
            newCurrentWeatherStatus: CurrrentWeatherError(dataState.error!)));
      }
    });
  }
}
