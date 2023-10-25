import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sky_watch/weather/presenter/bloc/weather_bloc.dart';
import 'package:sky_watch/weather/presenter/bloc/weather_state.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherBloc _weatherBloc = GetIt.I<WeatherBloc>();

  @override
  void initState() {
    _weatherBloc.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherPage'),
        backgroundColor: Colors.green,
        actions: const [],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: _weatherBloc,
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherResultState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Temperature: ${state.weather.temperature}°  ',
                      style: const TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 40.0,
                      ),
                    ),
                    Text(
                      'condition: ${state.weather.condition}  ',
                      style: const TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 40.0,
                      ),
                    ),
                    Text(
                      'humidity: ${state.weather.humidity}  ',
                      style: const TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 40.0,
                      ),
                    ),
                    Text(
                      'Country: ${state.weather.country}  ',
                      style: const TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 40.0,
                      ),
                    ),
                    Text(
                      'City: ${state.weather.city}  ',
                      style: const TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: TextButton(
                onPressed: () {
                  _weatherBloc.fetch();
                },
                child: const Text('Try again'),
              ),
            );
          }),
    );
  }
}
