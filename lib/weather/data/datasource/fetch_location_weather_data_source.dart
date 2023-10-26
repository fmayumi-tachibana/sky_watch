import 'package:sky_watch/core/request/request.dart';
import 'package:sky_watch/weather/domain/entities/request/fetch_weather_request.dart';

abstract class FetchLocationWeatherDataSource {
  Future<Map<String, dynamic>?> call(FetchWeatherRequest request);
}

class FetchLocationWeatherDataSourceImpl
    implements FetchLocationWeatherDataSource {
  @override
  Future<Map<String, dynamic>?> call(FetchWeatherRequest request) async {
    try {
      const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';
      String apiKey = 'b85af4d0f3f27871650a29722dc40edc';

      Request post = Request(
        '$weatherApiUrl?lat=${request.latitude}&lon=${request.longitude}&appid=$apiKey&units=imperial',
      );
      var weatherData = await post();

      return weatherData;
    } catch (e) {
      return null;
    }
  }
}
