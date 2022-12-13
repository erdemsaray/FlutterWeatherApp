import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

import '../utils/weather.dart';
import 'location_select.dart';
import 'setting_screen.dart';

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
      temperature = weatherData.currentTemperature?.round();
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
        child: const Icon(
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
                "${(Provider.of<WeatherData>(context).currentTemperature!).toInt()} °C",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  letterSpacing: -5,
                ),
              ),
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Provider.of<WeatherData>(context).currentName ?? 'Texas',
                  style:
                      const TextStyle(fontSize: 38, color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.w300),
                ),
              ],
            )),
            IconButton(
                onPressed: () {
                  Navigator.push(this.context, MaterialPageRoute(builder: (context) {
                    return const LocationPage();
                  }));
                },
                icon: const Icon(
                  Icons.edit,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }

  void screenTest() {
    int sayac = testCounter % 3;

    setState(() {
      if (sayac == 0) {
        backgroundImage = const AssetImage('assets/sunny.jpg');
        weatherDisplayIcon = const Icon(WeatherIcons.day_sunny, size: 80);
      } else if (sayac == 1) {
        backgroundImage = const AssetImage('assets/rainy.jpg');
        weatherDisplayIcon = const Icon(WeatherIcons.day_rain, size: 80);
      } else {
        backgroundImage = const AssetImage('assets/cloudy.jpg');
        weatherDisplayIcon = const Icon(
          WeatherIcons.day_cloudy,
          size: 80,
        );
      }
    });
    testCounter++;
  }
}
