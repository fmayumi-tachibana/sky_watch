import 'package:sky_watch/weather/domain/entities/request/fetch_weather_request.dart';

class FetchWeatherRequestModel extends FetchWeatherRequest {
  FetchWeatherRequestModel(
    super.altitude,
    super.longitude,
  );

  factory FetchWeatherRequestModel.copy(FetchWeatherRequest request) {
    return FetchWeatherRequestModel(
      request.altitude,
      request.longitude,
    );
  }
}
