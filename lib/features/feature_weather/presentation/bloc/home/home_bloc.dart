import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/params/forecast_params.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather/features/feature_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:weather/features/feature_weather/presentation/bloc/home/current_weather_status.dart';
import 'package:weather/features/feature_weather/presentation/bloc/home/fw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  final GetForecastWeatherUseCase _getForecastWeatherUseCase;

  HomeBloc(this._getForecastWeatherUseCase, this.getCurrentWeatherUsecase)
      : super(HomeState(cwStatus: CwLoading(), fwStatus: FwLoading())) {
    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newCurrentWeatherStatus: CwLoading()));

      DataState dataState = await getCurrentWeatherUsecase(event.cityName);
      print(dataState.toString());
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newCurrentWeatherStatus: CwCompleted(dataState.data)));
        print(state.cwStatus.toString() + '111111111111111111');
      }

      if (dataState is DataFailed) {
        emit(
            state.copyWith(newCurrentWeatherStatus: CwError(dataState.error!)));
      }
    });

    /// load 7 days Forecast weather for city Event
    on<LoadFwEvent>((event, emit) async {
      /// emit State to Loading for just Fw
      emit(state.copyWith(newFwStatus: FwLoading()));

      DataState dataState =
          await _getForecastWeatherUseCase(event.forecastParams);

      /// emit State to Completed for just Fw
      if (dataState is DataSuccess) {
        emit(state.copyWith(newFwStatus: FwCompleted(dataState.data)));
      }

      /// emit State to Error for just Fw
      if (dataState is DataFailed) {
        emit(state.copyWith(newFwStatus: FwError(dataState.error)));
      }
    });
  }
}
