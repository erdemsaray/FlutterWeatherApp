import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

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
