import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_watch/forecast/domain/usecases/fetch_location_forecast_use_case.dart';
import 'package:sky_watch/forecast/presenter/bloc/forecast_state.dart';
import 'package:sky_watch/weather/domain/usecases/fetch_current_location_use_case.dart';

class ForecastBloc extends Cubit<ForecastState> {
  ForecastBloc(
    this._fetchCurrentLocationUseCase,
    this._fetchLocationForecastUseCase,
  ) : super(ForecastIdleState());

  final FetchCurrentLocationUseCase _fetchCurrentLocationUseCase;
  final FetchLocationForecastUseCase _fetchLocationForecastUseCase;

  Future<void> fetch() async {
    emit(ForecastLoadingState());

    final currentLocation = await _fetchCurrentLocationUseCase();

    if (currentLocation != null) {
      final locationForecast =
          await _fetchLocationForecastUseCase(currentLocation);
      if (locationForecast != null) {
        emit(ForecastResultState(locationForecast));
      } else {
        emit(ForecastErrorState(Failure()));
      }
    } else {
      emit(ForecastErrorState(Failure()));
    }
  }
}
