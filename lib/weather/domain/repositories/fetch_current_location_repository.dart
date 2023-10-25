import 'package:geolocator/geolocator.dart';

abstract class FetchCurrentLocationRepository {
  Future<Position?> call();
}
