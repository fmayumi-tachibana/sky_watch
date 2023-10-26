abstract class Forecast {
  Forecast(
    this.summary,
    this.min,
    this.max,
    this.date,
  );

  final String? summary;
  final num? min;
  final num? max;
  final DateTime? date;
}
