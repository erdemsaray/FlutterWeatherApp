import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/screens/setting_screen.dart';
import 'package:weather_app/utils/weather.dart';
import 'package:weather_icons/weather_icons.dart';

class MainScreen extends StatefulWidget {
  final WeatherData weatherData;

  const MainScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? temperature;
  Icon? weatherDisplayIcon;
  AssetImage? backgroundImage;
  String? weatherCityName;
  int testCounter = 1;

  updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      WeatherDisplayData? weatherDisplayData = weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplayData?.weatherImage;
      weatherDisplayIcon = weatherDisplayData?.weatherIcon;
      weatherCityName = weatherDisplayData?.weatherCityName;
    });
    print(weatherDisplayIcon!.size!);
  }

  @override
  void initState() {
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  String _celciusValue = "15 °C";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.push(this.context, MaterialPageRoute(builder: (context) {
            return SettingsPage();
          }));
        },
        child: Icon(
          Icons.settings,
          color: Colors.white,
          size: 50,
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(image: backgroundImage ?? const AssetImage('assets/sunny.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 70,
            ),
            // ignore: avoid_unnecessary_containers
            Container(child: weatherDisplayIcon),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Text(
                "$temperature°C",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  letterSpacing: -5,
                ),
              ),
            ),
            Center(
                child: Text(
              weatherCityName ?? 'Texas',
              style: TextStyle(fontSize: 50, color: Colors.white, letterSpacing: 5, fontWeight: FontWeight.w300),
            )),
          ],
        ),
      ),
    );
  }

  void screenTest() {
    int sayac = testCounter % 3;

    setState(() {
      if (sayac == 0) {
        backgroundImage = AssetImage('assets/sunny.jpg');
        weatherDisplayIcon = Icon(WeatherIcons.day_sunny, size: 80);
      } else if (sayac == 1) {
        backgroundImage = AssetImage('assets/rainy.jpg');
        weatherDisplayIcon = Icon(WeatherIcons.day_rain, size: 80);
      } else {
        backgroundImage = AssetImage('assets/cloudy.jpg');
        weatherDisplayIcon = Icon(
          WeatherIcons.day_cloudy,
          size: 80,
        );
      }
    });
    testCounter++;
  }
}
