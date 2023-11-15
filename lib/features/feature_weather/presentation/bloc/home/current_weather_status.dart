import 'package:flutter/foundation.dart' show immutable;
import 'package:weather/features/feature_weather/domain/entities/current_city_entity.dart';

@immutable
abstract class CwStatus {}

class CwLoading extends CwStatus {}

class CwCompleted extends CwStatus {
  CwCompleted(this.currentCityEntity);
  final CurrentCityEntity currentCityEntity;
}

class CwError extends CwStatus {
  CwError(this.message);
  final String message;
}
