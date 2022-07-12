import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/main_screen.dart';
import 'package:weather_app/utils/location.dart';
import 'package:weather_app/utils/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationManager locationData;

  Future<void> getLocationData() async {
    locationData = LocationManager();
    await locationData.getCurrentLocation();

    if (locationData.latitude == null || locationData.longitude == null) {
      print("Location values error");
    } else {
      print("Latitude: ${locationData.latitude}");
      print("Longitude: ${locationData.longitude}");
    }
  }

  void getWeatherData() async {
    await getLocationData();

    WeatherData weatherData = WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();

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
