import 'package:dio/dio.dart';
import 'package:weather/core/params/forecast_params.dart';
import 'package:weather/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();
  String apiKey = Constants.apiKey;

  /// current weather api
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio
        .get("${Constants.baseUrl}/data/2.5/weather", queryParameters: {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
    });
    print(response.data);
    return response;
  }

  /// 7 days forecast api
  Future<dynamic> sendRequest7DaysForcast(ForecastParams params) async {
    var response = await _dio.get(
      "${Constants.baseUrl}/data/2.5/onecall",
      queryParameters: {
        'lat': params.lat,
        'lon': params.lon,
        'exclude': 'minutely,hourly',
        'appid': apiKey,
        'units': 'metric'
      },
      // options: Options(
      //   validateStatus: (_) => true,
      //   contentType: Headers.jsonContentType,
      //   responseType: ResponseType.json,
      // )
    );

    return response;
  }
}
