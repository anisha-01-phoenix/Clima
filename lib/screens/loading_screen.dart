import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0, longitude = 0.0;

  //async -> Way to carry out time consuming tasks such as GPS location from the phone. (takes unpredictable time)
  //Asynchronous Programming is used to perform these time consuming tasks in the background instead of happening in the foreground and freezing up the app

  void getLocationData() async {
    Location location = Location();
    Position position = await location.getCurrentLocation();
    latitude = position.latitude;
    longitude = position.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocationData();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
