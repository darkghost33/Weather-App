import 'package:http/http.dart' as http;
import 'package:weather_app/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryPrameters = {
      'q': city,
      'appid': 'e191d35db3233d64f6daf421ea516125',
      'units': 'metric'
    };
    final uri =
        Uri.http('api.openweathermap.org', '/data/2.5/weather', queryPrameters);
    final response = await http.get(uri);

    print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
