import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/location.dart';
import '../utils/weather.dart';
import 'main_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationManager locationData;

  Future<void> getLocationData() async {
    locationData = LocationManager();
    locationData.latitude = 37.7282;
    locationData.longitude = 28.6057;
    try {
      await locationData.getCurrentLocation();
    } catch (e) {
      if (locationData.latitude == null || locationData.longitude == null) {
        locationData.latitude = 37.4219927;
        locationData.longitude = -122.0840173;
      } else {
        print("Latitude: ${locationData.latitude}");
        print("Longitude: ${locationData.longitude}");
      }
    }
  }

  void getWeatherData() async {
    await getLocationData();

    WeatherData weatherData = WeatherData();
    await weatherData.getCurrentTemperature(locationData);

    if (weatherData.currentTemperature == null || weatherData.currentCondition == null) {
      print("Api values error");
    }

    Navigator.pushReplacement(this.context, MaterialPageRoute(builder: (context) {
      return MainScreen(
        weatherData: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();

    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
        Color.fromARGB(255, 10, 87, 151),
        Color.fromARGB(255, 47, 125, 50),
      ])),
      child: const Center(
        child: SpinKitSpinningLines(
          color: Colors.yellow,
          size: 150,
          duration: Duration(seconds: 1),
        ),
      ),
    ));
  }
}
