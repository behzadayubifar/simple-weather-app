import 'package:equatable/equatable.dart';
import 'package:weather/features/feature_weather/data/models/current_city_model/clouds.dart';
import 'package:weather/features/feature_weather/data/models/current_city_model/coord.dart';
import 'package:weather/features/feature_weather/data/models/current_city_model/main.dart';
import 'package:weather/features/feature_weather/data/models/current_city_model/rain.dart';
import 'package:weather/features/feature_weather/data/models/current_city_model/sys.dart';
import 'package:weather/features/feature_weather/data/models/current_city_model/weather.dart';
import 'package:weather/features/feature_weather/data/models/current_city_model/wind.dart';

class CurrentCityEntity extends Equatable {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Rain? rain;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentCityEntity({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        rain,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
      ];
}
