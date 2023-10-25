import 'package:geolocator/geolocator.dart';

abstract class FetchCurrentLocationDataSource {
  Future<Position?> call();
}

class FetchCurrentLocationDataSourceImpl
    implements FetchCurrentLocationDataSource {
  @override
  Future<Position?> call() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return Future.error('Location Not Available');
        }
      } else if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      return null;
    }
  }
}
