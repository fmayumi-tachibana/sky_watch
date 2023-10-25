import 'package:sky_watch/weather/domain/entities/response/weather.dart';

abstract class WeatherState {}

class WeatherIdleState implements WeatherState {}

class WeatherLoadingState implements WeatherState {}

class WeatherErrorState implements WeatherState {
  WeatherErrorState(this.error);

  final Failure error;
}

class WeatherResultState implements WeatherState {
  const WeatherResultState(this.weather);

  final Weather weather;
}

class Failure {
  Failure([
    this.message =
    'Error :( try again ',
  ]);
  final String message;
}
