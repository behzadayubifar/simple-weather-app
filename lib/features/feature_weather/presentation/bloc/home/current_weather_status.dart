import 'package:flutter/foundation.dart' show immutable;
import 'package:weather/features/feature_weather/domain/entities/current_city_entity.dart';

@immutable
abstract class CurrentWeatherStatus {}

class CurrentWeatherLoading extends CurrentWeatherStatus {}

class CurrentWeatherLoaded extends CurrentWeatherStatus {
  CurrentWeatherLoaded(this.currentCityEntity);
  final CurrentCityEntity currentCityEntity;
}

class CurrrentWeatherError extends CurrentWeatherStatus {
  CurrrentWeatherError(this.message);
  final String message;
}
