import 'package:weather/core/resources/data_state.dart';
import 'package:weather/core/use_case/use_case.dart';
import 'package:weather/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather/features/feature_weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUsecase
    implements UseCase<DataState<CurrentCityEntity>, String> {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUsecase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call(cityName) {
    return weatherRepository.fetchCurrentCityWeather(cityName);
  }
}
