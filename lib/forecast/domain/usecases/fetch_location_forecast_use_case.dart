import 'package:geolocator/geolocator.dart';
import 'package:sky_watch/forecast/domain/entities/response/forecast.dart';
import 'package:sky_watch/forecast/domain/repositories/fetch_location_forecast_repository.dart';

abstract class FetchLocationForecastUseCase {
  Future<List<Forecast>?> call(Position position);
}

class FetchLocationForecastUseCaseImpl implements FetchLocationForecastUseCase {
  FetchLocationForecastUseCaseImpl(this.repository);

  final FetchLocationForecastRepository repository;

  @override
  Future<List<Forecast>?> call(Position position) {
    return repository(position);
  }
}
