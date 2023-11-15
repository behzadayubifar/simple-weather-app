import 'package:dio/dio.dart';
import 'package:weather/core/params/forecast_params.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weather/features/feature_weather/data/models/current_city_model/current_city_model.dart';
import 'package:weather/features/feature_weather/data/models/forecast_days_model.dart';
import 'package:weather/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather/features/feature_weather/domain/entities/forecast_days_entity.dart';
import 'package:weather/features/feature_weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  ApiProvider apiProvider;
  WeatherRepositoryImpl(this.apiProvider);
  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentCityWeather(
      String cityName) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);

      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response.data);
        print('000000000');
        return DataSuccess(currentCityEntity);
      } else {
        return DataFailed("Something went wrong. Try agian ...");
      }
    } catch (e) {
      return DataFailed("please check your connection ...");
    }
  }

  @override
  Future<DataState<ForecastDaysEntity>> fetchForecastWeatherData(
      ForecastParams params) async {
    try {
      Response response = await apiProvider.sendRequest7DaysForcast(params);

      if (response.statusCode == 200) {
        ForecastDaysEntity forecastDaysEntity =
            ForecastDaysModel.fromJson(response.data);
        return DataSuccess(forecastDaysEntity);
      } else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    } catch (e) {
      print(e.toString());
      return const DataFailed("please check your connection...");
    }
  }
}
