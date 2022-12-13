import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/loading_screen.dart';
import 'utils/weather.dart';

void main() =>
    runApp(ChangeNotifierProvider<WeatherData>(create: (BuildContext context) => WeatherData(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}
