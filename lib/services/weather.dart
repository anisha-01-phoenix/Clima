import 'package:geolocator/geolocator.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import '../services/location.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var uri = '$apiUrl?g=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(uri);
    networkHelper.getData();
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    Position position = await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$apiUrl?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
