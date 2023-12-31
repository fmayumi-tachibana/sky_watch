import 'package:sky_watch/forecast/di/location_forecast.dart';
import 'package:sky_watch/weather/di/current_location_di.dart';
import 'package:sky_watch/weather/di/location_weather.dart';

class DependenceInjection {
  void call() {
    CurrentLocationDI()();
    LocationWeatherDI()();
    LocationForecastDI()();
  }
}