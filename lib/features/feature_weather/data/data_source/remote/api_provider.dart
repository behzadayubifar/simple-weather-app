import 'package:dio/dio.dart';
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
}
