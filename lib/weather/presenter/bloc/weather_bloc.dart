import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_watch/weather/domain/usecases/fetch_current_location_use_case.dart';
import 'package:sky_watch/weather/domain/usecases/fetch_location_weather_use_case.dart';
import 'package:sky_watch/weather/presenter/bloc/weather_state.dart';

class WeatherBloc extends Cubit<WeatherState> {
  WeatherBloc(
    this._fetchCurrentLocationUseCase,
    this._fetchLocationWeatherUseCase,
  ) : super(WeatherIdleState());

  final FetchCurrentLocationUseCase _fetchCurrentLocationUseCase;
  final FetchLocationWeatherUseCase _fetchLocationWeatherUseCase;

  Future<void> fetch() async {
    emit(WeatherLoadingState());

    final currentLocation = await _fetchCurrentLocationUseCase();

    if (currentLocation != null) {
      final locationWeather =
          await _fetchLocationWeatherUseCase(currentLocation);
      if (locationWeather != null) {
        emit(WeatherResultState(locationWeather));
      } else {
        emit(WeatherErrorState(Failure()));
      }
    } else {
      emit(WeatherErrorState(Failure()));
    }
  }
}
