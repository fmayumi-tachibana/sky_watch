import 'package:geolocator/geolocator.dart';
import 'package:sky_watch/weather/domain/entities/response/weather.dart';
import 'package:sky_watch/weather/domain/repositories/fetch_location_weather_repository.dart';

abstract class FetchLocationWeatherUseCase {
  Future<Weather?> call(Position position);
}

class FetchLocationWeatherUseCaseImpl implements FetchLocationWeatherUseCase {
  FetchLocationWeatherUseCaseImpl(this.repository);

  final FetchLocationWeatherRepository repository;

  @override
  Future<Weather?> call(Position position) {
    return repository(position);
  }
}
