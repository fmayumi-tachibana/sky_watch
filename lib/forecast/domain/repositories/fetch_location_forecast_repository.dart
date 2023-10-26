import 'package:geolocator/geolocator.dart';
import 'package:sky_watch/forecast/domain/entities/response/forecast.dart';
import 'package:sky_watch/weather/domain/entities/response/weather.dart';

abstract class FetchLocationForecastRepository {
  Future<List<Forecast>?> call(Position position);
}
