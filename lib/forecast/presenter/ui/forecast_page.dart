import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:sky_watch/core/extensions/date_time_extension.dart';
import 'package:sky_watch/forecast/presenter/bloc/forecast_bloc.dart';
import 'package:sky_watch/forecast/presenter/bloc/forecast_state.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final ForecastBloc _forecastBloc = GetIt.I<ForecastBloc>();
  final double _fontSize = 15;

  @override
  void initState() {
    _forecastBloc.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forecasts")),
      body: BlocBuilder<ForecastBloc, ForecastState>(
          bloc: _forecastBloc,
          builder: (BuildContext context, ForecastState state) {
            if (state is ForecastLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ForecastResultState) {
              return ListView.separated(
                itemCount: state.forecast.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(
                        state.forecast[index].date?.weekdayName() ?? '',
                        style: TextStyle(
                          fontSize: _fontSize,
                        ),
                      ),
                      Text(
                        '${DateFormat('HH:mm').format(
                            state.forecast[index].date ?? DateTime.now())} h',
                        style: TextStyle(
                          fontSize: _fontSize,
                        ),
                      ),
                      Text(
                        'min ${state.forecast[index].min.toString()} °F',
                        style: TextStyle(
                          fontSize: _fontSize,
                        ),
                      ),
                      Text(
                        'max ${state.forecast[index].max.toString()} °F',
                        style: TextStyle(
                          fontSize: _fontSize,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            }
            return Center(
              child: TextButton(
                onPressed: () {
                  _forecastBloc.fetch();
                },
                child: const Text('Try again'),
              ),
            );
          }),
    );
  }
}
