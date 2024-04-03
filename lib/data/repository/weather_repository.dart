import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherRepository {
  // for the purpose of unit testing we have to define this and get it in a constructor

  final WeatherDataProvider weatherDataProvider;

// Constructor
  WeatherRepository({required this.weatherDataProvider});

// get raw data and convert it into actual data
  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Karachi';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      print("Api Data " + data.toString());
      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
