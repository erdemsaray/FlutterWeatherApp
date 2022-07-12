import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:weather_app/utils/location.dart';
import 'package:weather_icons/weather_icons.dart';

const apiKey = "ced9a3fab1a99af068816f29be7e79cd";

class WeatherDisplayData {
  Icon weatherIcon;
  AssetImage weatherImage;
  String weatherCityName;

  WeatherDisplayData({required this.weatherIcon, required this.weatherImage, required this.weatherCityName});
}

class WeatherData {
  WeatherData({required this.locationData});

  LocationManager locationData;

  late double currentTemperature;
  late int currentCondition;
  late String currentName;

  Future<void> getCurrentTemperature() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=$apiKey&units=metric"));

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
        currentName = currentWeather['name'];
      } catch (e) {
        print(e);
      }
    } else {
      print('apiden deger gelmiyor');
    }
  }

  WeatherDisplayData? getWeatherDisplayData() {
    double _iconSize = 80;

    if (currentCondition > 800) {
      return WeatherDisplayData(
          weatherIcon: Icon(
            WeatherIcons.day_cloudy,
            size: _iconSize,
          ),
          weatherImage: const AssetImage('assets/cloudy.jpg'),
          weatherCityName: currentName);
    } else if (currentCondition < 600) {
      return WeatherDisplayData(
          weatherIcon: Icon(
            WeatherIcons.rain,
            size: _iconSize,
          ),
          weatherImage: const AssetImage('assets/rainy.jpg'),
          weatherCityName: currentName);
    } else {
      var now = DateTime.now();

      if (now.hour >= 19 && now.hour <= 5) {
        return WeatherDisplayData(
            weatherIcon: Icon(
              WeatherIcons.moon_alt_full,
              size: _iconSize,
            ),
            weatherImage: const AssetImage('assets/sunny.jpg'),
            weatherCityName: currentName);
      } else {
        return WeatherDisplayData(
            weatherIcon: Icon(
              WeatherIcons.day_sunny,
              size: _iconSize,
            ),
            weatherImage: const AssetImage('assets/sunny.jpg'),
            weatherCityName: currentName);
      }
    }
  }
}
