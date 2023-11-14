import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/feature_weather/domain/entities/current_city_entity.dart';

abstract interface class WeatherRepository {
  Future<DataState<CurrentCityEntity>> fetchCurrentCityWeather(String cityName);
}
