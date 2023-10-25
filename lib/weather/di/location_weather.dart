import 'package:get_it/get_it.dart';
import 'package:sky_watch/weather/data/datasource/fetch_location_weather_data_source.dart';
import 'package:sky_watch/weather/data/repository/fetch_location_weather_repository_impl.dart';
import 'package:sky_watch/weather/domain/repositories/fetch_location_weather_repository.dart';
import 'package:sky_watch/weather/domain/usecases/fetch_current_location_use_case.dart';
import 'package:sky_watch/weather/domain/usecases/fetch_location_weather_use_case.dart';
import 'package:sky_watch/weather/presenter/bloc/weather_bloc.dart';

class LocationWeatherDI {
  void call() {
    GetIt.I.registerFactory<FetchLocationWeatherDataSource>(
      () => FetchLocationWeatherDataSourceImpl(),
    );

    GetIt.I.registerFactory<FetchLocationWeatherRepository>(
      () => FetchLocationWeatherRepositoryImpl(
        GetIt.I<FetchLocationWeatherDataSource>(),
      ),
    );

    GetIt.I.registerFactory<FetchLocationWeatherUseCase>(
      () => FetchLocationWeatherUseCaseImpl(
        GetIt.I<FetchLocationWeatherRepository>(),
      ),
    );

    GetIt.I.registerFactory<WeatherBloc>(
      () => WeatherBloc(
        GetIt.I<FetchCurrentLocationUseCase>(),
        GetIt.I<FetchLocationWeatherUseCase>(),
      ),
    );
  }
}
