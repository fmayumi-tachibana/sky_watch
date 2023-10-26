import 'package:get_it/get_it.dart';
import 'package:sky_watch/forecast/data/datasource/fetch_location_forecast_data_source.dart';
import 'package:sky_watch/forecast/data/repository/fetch_location_forecast_repository_impl.dart';
import 'package:sky_watch/forecast/domain/repositories/fetch_location_forecast_repository.dart';
import 'package:sky_watch/forecast/domain/usecases/fetch_location_forecast_use_case.dart';
import 'package:sky_watch/forecast/presenter/bloc/forecast_bloc.dart';
import 'package:sky_watch/weather/data/datasource/fetch_location_weather_data_source.dart';
import 'package:sky_watch/weather/data/repository/fetch_location_weather_repository_impl.dart';
import 'package:sky_watch/weather/domain/repositories/fetch_location_weather_repository.dart';
import 'package:sky_watch/weather/domain/usecases/fetch_current_location_use_case.dart';
import 'package:sky_watch/weather/domain/usecases/fetch_location_weather_use_case.dart';
import 'package:sky_watch/weather/presenter/bloc/weather_bloc.dart';

class LocationForecastDI {
  void call() {
    GetIt.I.registerFactory<FetchLocationForecastDataSource>(
      () => FetchLocationForecastDataSourceImpl(),
    );

    GetIt.I.registerFactory<FetchLocationForecastRepository>(
      () => FetchLocationForecastRepositoryImpl(
        GetIt.I<FetchLocationForecastDataSource>(),
      ),
    );

    GetIt.I.registerFactory<FetchLocationForecastUseCase>(
      () => FetchLocationForecastUseCaseImpl(
        GetIt.I<FetchLocationForecastRepository>(),
      ),
    );

    GetIt.I.registerFactory<ForecastBloc>(
      () => ForecastBloc(
        GetIt.I<FetchCurrentLocationUseCase>(),
        GetIt.I<FetchLocationForecastUseCase>(),
      ),
    );
  }
}
