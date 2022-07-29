import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel model = WeatherModel();

  //async -> Way to carry out time consuming tasks such as GPS location from the phone. (takes unpredictable time)
  //Asynchronous Programming is used to perform these time consuming tasks in the background instead of happening in the foreground and freezing up the app

  void getLocationData() async {
    var weatherData = await model.getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitPianoWave(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
