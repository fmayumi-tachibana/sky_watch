import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:sky_watch/core/extensions/date_time_extension.dart';
import 'package:sky_watch/forecast/presenter/ui/forecast_page.dart';
import 'package:sky_watch/weather/presenter/bloc/weather_bloc.dart';
import 'package:sky_watch/weather/presenter/bloc/weather_state.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherBloc _weatherBloc = GetIt.I<WeatherBloc>();

  final double _fontSize = 15;

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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        DateTime.now().weekdayName() ?? '',
                        style: TextStyle(
                          fontSize: _fontSize,
                        ),
                      ),
                      Text(
                        '${DateFormat('HH:mm').format(DateTime.now())} h',
                        style: TextStyle(
                          fontSize: _fontSize,
                        ),
                      ),
                      Text(
                        'temperature: ${state.weather.temperature} °F',
                        style: TextStyle(
                          fontFamily: 'Spartan MB',
                          fontSize: _fontSize,
                        ),
                      ),
                      Text(
                        'condition: ${state.weather.condition}',
                        style: TextStyle(
                          fontFamily: 'Spartan MB',
                          fontSize: _fontSize,
                        ),
                      ),
                      Text(
                        'humidity: ${state.weather.humidity}',
                        style: TextStyle(
                          fontFamily: 'Spartan MB',
                          fontSize: _fontSize,
                        ),
                      ),
                      Text(
                        'Country: ${state.weather.country}',
                        style: TextStyle(
                          fontFamily: 'Spartan MB',
                          fontSize: _fontSize,
                        ),
                      ),
                      Text(
                        'City: ${state.weather.city}',
                        style: TextStyle(
                          fontFamily: 'Spartan MB',
                          fontSize: _fontSize,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForecastPage(),
                            ),
                          );
                        },
                        child: const Text('Forecasts'),
                      )
                    ],
                  ),
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
