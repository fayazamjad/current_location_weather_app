import 'package:clima_project/services/location.dart';
import 'package:clima_project/services/networking.dart';

const apikey = '28aa544a1d38ab8e982a07275e93bcf8';
const openweathermapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityweather(String cityName) async {
    String url = '$openweathermapURL?q$cityName&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getCurrentlocation();
    String url =
        '$openweathermapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    print('fayaz 1');
    var data = await networkHelper.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
