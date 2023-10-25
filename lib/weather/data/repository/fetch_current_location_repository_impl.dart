import 'package:geolocator/geolocator.dart';
import 'package:sky_watch/weather/data/datasource/fetch_current_location_data_source.dart';
import 'package:sky_watch/weather/domain/repositories/fetch_current_location_repository.dart';

class FetchCurrentLocationRepositoryImpl implements FetchCurrentLocationRepository {
  FetchCurrentLocationRepositoryImpl(this.dataSource);

  final FetchCurrentLocationDataSource dataSource;

  @override
  Future<Position?> call() {
    return dataSource();
  }
}
