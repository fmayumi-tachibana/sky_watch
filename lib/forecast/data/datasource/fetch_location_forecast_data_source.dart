import 'package:sky_watch/core/request/request.dart';
import 'package:sky_watch/forecast/domain/entities/request/fetch_forecast_request.dart';

abstract class FetchLocationForecastDataSource {
  Future<Map<String, dynamic>?> call(FetchForecastRequest request);
}

class FetchLocationForecastDataSourceImpl
    implements FetchLocationForecastDataSource {
  @override
  Future<Map<String, dynamic>?> call(FetchForecastRequest request) async {
    try {
      const forecastApiUrl = 'https://api.openweathermap.org/data/2.5/forecast';
      String apiKey = 'b85af4d0f3f27871650a29722dc40edc';

      Request post = Request(
        '$forecastApiUrl?lat=${request.latitude}&lon=${request.longitude}&appid=$apiKey&units=imperial',
      );
      var forecastData = await post();

      return forecastData;
    } catch (e) {
      return null;
    }
  }
}
