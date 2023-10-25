import 'package:geolocator/geolocator.dart';
import 'package:sky_watch/weather/domain/entities/response/weather.dart';

abstract class FetchLocationWeatherRepository {
  Future<Weather?> call(Position position);
}
