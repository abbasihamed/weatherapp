import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  List<Weather> _weatherData = [];
  bool loaded = false;
  String cityName = 'Tehran';
  String cityPhotoAdd = 'assets/city/london.jpg';
  String weatherImage = 'assets/images/sunny.jpeg';
  String weatherIcon = 'assets/images/cloud.png';

  List<Weather?> get weatherData => _weatherData;

  Future weatherRequest({String? city}) async {
    if (city != null) {
      cityName = city;
    }
    var response = await http.get(
      Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$yuorId'),
    );
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List<Weather> afterLoad = [];
      var result = Weather.fromJson(data);
      afterLoad.add(result);
      _weatherData = afterLoad;
      loaded = true;
    }
    notifyListeners();
  }

  weatherImages() {
    if (_weatherData[0].weather?[0]['main'] == 'Clear') {
      weatherImage = 'assets/images/sunny.jpg';
      weatherIcon = 'assets/images/cloud.png';
    } else if (_weatherData[0].weather?[0]['main'] == 'Clouds' ||
        _weatherData[0].weather?[0]['main'] == 'Atmosphere') {
      weatherImage = 'assets/images/cloudy.jpeg';
      weatherIcon = 'assets/images/clouds.png';
    } else if (_weatherData[0].weather?[0]['main'] == 'Rain' ||
        _weatherData[0].weather?[0]['main'] == 'Drizzle') {
      weatherImage = 'assets/images/rainy.jpg';
      weatherIcon = 'assets/images/rain.png';
    } else if (_weatherData[0].weather?[0]['main'] == 'Thunderstorm') {
      weatherImage = 'assets/images/1.jpg';
      weatherIcon = 'assets/images/clouds.png';
    } else if (_weatherData[0].weather?[0]['main'] == 'Snow') {
      weatherImage = 'assets/images/snow.jpg';
      weatherIcon = 'assets/images/snow.png';
    }
  }

  searchPhoto() {
    var rand = Random().nextInt(3);
    if (rand == 0) {
      cityPhotoAdd = 'assets/city/london.jpg';
    } else if (rand == 1) {
      cityPhotoAdd = 'assets/city/new_york.jpg';
    } else {
      cityPhotoAdd = 'assets/city/tokyo.jpg';
    }
  }
}
