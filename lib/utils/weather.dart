import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';

import 'location.dart';

const apiKey = "ced9a3fab1a99af068816f29be7e79cd";

class WeatherDisplayData {
  Icon weatherIcon;
  AssetImage weatherImage;
  String weatherCityName;

  WeatherDisplayData({required this.weatherIcon, required this.weatherImage, required this.weatherCityName});
}

class WeatherData with ChangeNotifier {
  double? currentTemperature;
  int? currentCondition;
  String? currentName;

  Future<void> getCurrentTemperature(LocationManager locationData) async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=$apiKey&units=metric"));

    print(("Location Data: $locationData"));
    print(("Location Latitude: ${locationData.latitude}"));
    print(("Location Longitude: ${locationData.longitude}"));

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

  void changeCityName(String newCity) {
    currentName = newCity;
    notifyListeners();
  }

  Future<bool> getCurrentTemperatureWithCityName(String city) async {
    Response response =
        await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric"));

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
        currentName = currentWeather['name'];
        notifyListeners();
        return true;
      } catch (e) {
        print(e);
      }
    } else {
      print('apiden deger gelmiyor');
    }
    notifyListeners();
    return false;
  }

  WeatherDisplayData? getWeatherDisplayData() {
    double _iconSize = 80;

    if (currentCondition! > 800) {
      return WeatherDisplayData(
          weatherIcon: Icon(
            WeatherIcons.day_cloudy,
            size: _iconSize,
          ),
          weatherImage: const AssetImage('assets/cloudy.jpg'),
          weatherCityName: currentName ?? 'belirsiz');
    } else if (currentCondition! < 600) {
      return WeatherDisplayData(
          weatherIcon: Icon(
            WeatherIcons.rain,
            size: _iconSize,
          ),
          weatherImage: const AssetImage('assets/rainy.jpg'),
          weatherCityName: currentName ?? 'belirsiz');
    } else {
      var now = DateTime.now();

      if (now.hour >= 19 && now.hour <= 5) {
        return WeatherDisplayData(
            weatherIcon: Icon(
              WeatherIcons.moon_alt_full,
              size: _iconSize,
            ),
            weatherImage: const AssetImage('assets/sunny.jpg'),
            weatherCityName: currentName ?? 'belirsiz');
      } else {
        return WeatherDisplayData(
            weatherIcon: Icon(
              WeatherIcons.day_sunny,
              size: _iconSize,
            ),
            weatherImage: const AssetImage('assets/sunny.jpg'),
            weatherCityName: currentName ?? 'belirsiz');
      }
    }
  }
}
