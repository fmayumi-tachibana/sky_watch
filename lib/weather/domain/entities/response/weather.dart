abstract class Weather {
  Weather(
    this.temperature,
    this.condition,
    this.humidity,
    this.country,
    this.city,
  );

  final num? temperature;
  final String? condition;
  final int? humidity;
  final String? country;
  final String? city;
}
