import 'package:get_it/get_it.dart';
import 'package:sky_watch/weather/data/datasource/fetch_current_location_data_source.dart';
import 'package:sky_watch/weather/data/repository/fetch_current_location_repository_impl.dart';
import 'package:sky_watch/weather/domain/repositories/fetch_current_location_repository.dart';
import 'package:sky_watch/weather/domain/usecases/fetch_current_location_use_case.dart';

class CurrentLocationDI {
  void call() {
    GetIt.I.registerFactory<FetchCurrentLocationDataSource>(
      () => FetchCurrentLocationDataSourceImpl(),
    );

    GetIt.I.registerFactory<FetchCurrentLocationRepository>(
      () => FetchCurrentLocationRepositoryImpl(
        GetIt.I<FetchCurrentLocationDataSource>(),
      ),
    );

    GetIt.I.registerFactory<FetchCurrentLocationUseCase>(
      () => FetchCurrentLocationUseCaseImpl(
        GetIt.I<FetchCurrentLocationRepository>(),
      ),
    );
  }
}
