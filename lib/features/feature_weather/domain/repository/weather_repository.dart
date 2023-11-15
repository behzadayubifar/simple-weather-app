import 'package:weather/core/params/forecast_params.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather/features/feature_weather/domain/entities/forecast_days_entity.dart';

abstract interface class WeatherRepository {
  Future<DataState<CurrentCityEntity>> fetchCurrentCityWeather(String cityName);
  Future<DataState<ForecastDaysEntity>> fetchForecastWeatherData(
      ForecastParams params);
}
