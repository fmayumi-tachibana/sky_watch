import 'package:flutter/material.dart';
import 'package:sky_watch/video_selector/presenter/ui/video_selector_page.dart';
import 'package:sky_watch/weather/presenter/ui/weather_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkyWatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VideoSelectorPage(),
                  ),
                );
              },
              child: const Text('Upload Video'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherPage(),
                  ),
                );
              },
              child: const Text('View Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
