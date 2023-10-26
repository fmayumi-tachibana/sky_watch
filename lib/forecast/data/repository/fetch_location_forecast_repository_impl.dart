import 'package:geolocator/geolocator.dart';
import 'package:sky_watch/forecast/data/datasource/fetch_location_forecast_data_source.dart';
import 'package:sky_watch/forecast/data/model/fetch_forecast_request_model.dart';
import 'package:sky_watch/forecast/data/model/forecast_model.dart';
import 'package:sky_watch/forecast/domain/entities/request/fetch_forecast_request.dart';
import 'package:sky_watch/forecast/domain/entities/response/forecast.dart';
import 'package:sky_watch/forecast/domain/repositories/fetch_location_forecast_repository.dart';

class FetchLocationForecastRepositoryImpl
    implements FetchLocationForecastRepository {
  FetchLocationForecastRepositoryImpl(this.dataSource);

  final FetchLocationForecastDataSource dataSource;

  @override
  Future<List<Forecast>?> call(Position position) async {
    final FetchForecastRequestModel request = FetchForecastRequestModel.copy(
      FetchForecastRequest(
        position.latitude,
        position.longitude,
      ),
    );
    final response = await dataSource(request);
    final list = (await response?['list'] as List)
        .map((data) => ForecastModel.fromJson(data))
        .toList();
    return list;
  }
}
