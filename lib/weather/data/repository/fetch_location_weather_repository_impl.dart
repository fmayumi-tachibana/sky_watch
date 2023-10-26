import 'package:geolocator/geolocator.dart';
import 'package:sky_watch/weather/data/datasource/fetch_location_weather_data_source.dart';
import 'package:sky_watch/weather/data/model/fetch_weather_request_model.dart';
import 'package:sky_watch/weather/data/model/weather_model.dart';
import 'package:sky_watch/weather/domain/entities/request/fetch_weather_request.dart';
import 'package:sky_watch/weather/domain/entities/response/weather.dart';
import 'package:sky_watch/weather/domain/repositories/fetch_location_weather_repository.dart';

class FetchLocationWeatherRepositoryImpl
    implements FetchLocationWeatherRepository {
  FetchLocationWeatherRepositoryImpl(this.dataSource);

  final FetchLocationWeatherDataSource dataSource;

  @override
  Future<Weather?> call(Position position) async {
    final FetchWeatherRequestModel request = FetchWeatherRequestModel.copy(
      FetchWeatherRequest(
        position.latitude,
        position.longitude,
      ),
    );
    final response = await dataSource(request);
    return response != null ? WeatherModel.fromJson(response) : null;
  }
}
