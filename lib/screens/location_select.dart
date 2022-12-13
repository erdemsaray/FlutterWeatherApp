import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/weather.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

int? radioButtonDil; //dil seçimi
int? radioButtonAralik; //aralık seçimi
bool? valueNotification;

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    setState(() {
      if (valueNotification == null) {
        valueNotification = true;
      }

      if (radioButtonDil == null) {
        radioButtonDil = 2;
      }

      if (radioButtonAralik == null) {
        radioButtonAralik = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).copyWith().size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Provider.of<WeatherData>(context, listen: false).getCurrentTemperatureWithCityName("Denizli");
          /*print(await weatherData.getCurrentTemperatureWithCityName("London"));
          print("Current name: ${weatherData.currentName}");*/
        },
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Location Select"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: heightSize,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
          Color.fromARGB(255, 10, 87, 151),
          Color.fromARGB(255, 47, 125, 50),
        ])),
        child: Container(),
      ),
    );
  }
}
