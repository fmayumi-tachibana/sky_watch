import 'package:sky_watch/forecast/domain/entities/request/fetch_forecast_request.dart';

class FetchForecastRequestModel extends FetchForecastRequest {
  FetchForecastRequestModel(
    super.latitude,
    super.longitude,
  );

  factory FetchForecastRequestModel.copy(FetchForecastRequest request) {
    return FetchForecastRequestModel(
      request.latitude,
      request.longitude,
    );
  }
}
