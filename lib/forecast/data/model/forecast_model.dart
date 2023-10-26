import 'package:sky_watch/forecast/domain/entities/response/forecast.dart';

class ForecastModel extends Forecast {
  ForecastModel(
    super.summary,
    super.min,
    super.max,
    super.date,
  );

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      '',
      json['main']['temp_min'] ?? 0,
      json['main']['temp_max'] ?? 0,
      DateTime.fromMicrosecondsSinceEpoch(json['dt'] * 1000000),
    );
  }
}
