import 'package:geolocator/geolocator.dart';
import 'package:sky_watch/weather/domain/repositories/fetch_current_location_repository.dart';

abstract class FetchCurrentLocationUseCase {
  Future<Position?> call();
}

class FetchCurrentLocationUseCaseImpl implements FetchCurrentLocationUseCase {
  FetchCurrentLocationUseCaseImpl(this.repository);

  final FetchCurrentLocationRepository repository;

  @override
  Future<Position?> call() {
    return repository();
  }
}
