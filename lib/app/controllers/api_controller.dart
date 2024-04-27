import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:weather_app_task/app/models/current_weather_model.dart';
import 'package:weather_app_task/app/models/forcastmodel.dart';

class ApiController {
  static const String baseUrl = "http://api.weatherapi.com/v1";
  static const Map<String, String> header = {
    "key": "ed4e0f0b212346a3840202051242604"
  };

  ///==================== Get Current Weather [getCurrentWeather] ===================
  static Future<CurrentWeather> getCurrentWeather(String location) async {
    CurrentWeather currentWeather = CurrentWeather();
    final url = Uri.parse("$baseUrl/current.json")
        .replace(queryParameters: {"q": location, "aqi": "yes"});
    log(url.toString());
    try {
      final response = await get(url, headers: header);
      log(response.body);
      if (response.statusCode == 200) {
        currentWeather = currentWeatherFromJson(response.body);
        log(currentWeather.location!.name.toString());
      }
      // return currentWeather;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      // return currentWeather;
    }
    return currentWeather;
  }

  ///==================== Get Forcast Weather [getForcastWeather] ===================
  static Future<ForcastModel> getForcastWeather() async {
    ForcastModel forcastModel = ForcastModel();
    final url = Uri.parse("$baseUrl/forecast.json")
        .replace(queryParameters: {"q": "London", "days": "8"});
    log(url.toString());
    try {
      final response = await get(url, headers: header);
      forcastModel = forcastModelFromJson(response.body);
      // log(forcastModelToJson(data));
      // log(response.body);
      // log(response.body);
      // return jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
    }
    return forcastModel;
  }
}
