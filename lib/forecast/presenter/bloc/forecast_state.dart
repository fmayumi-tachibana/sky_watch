import 'package:sky_watch/forecast/domain/entities/response/forecast.dart';

abstract class ForecastState {}

class ForecastIdleState implements ForecastState {}

class ForecastLoadingState implements ForecastState {}

class ForecastErrorState implements ForecastState {
  ForecastErrorState(this.error);

  final Failure error;
}

class ForecastResultState implements ForecastState {
  const ForecastResultState(this.forecast);

  final List<Forecast> forecast;
}

class Failure {
  Failure([
    this.message =
    'Error :( try again ',
  ]);
  final String message;
}
