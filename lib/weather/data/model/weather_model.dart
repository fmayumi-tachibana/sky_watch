import 'package:sky_watch/weather/domain/entities/response/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
    super.temperature,
    super.condition,
    super.humidity,
    super.country,
    super.city,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      json['main']['temp'] ?? 0,
      json['weather'][0]['main'] ?? 0,
      json['main']['humidity'] ?? 0,
      json['sys']['country'] ?? '',
      json['name'] ?? '',
    );
  }
}
