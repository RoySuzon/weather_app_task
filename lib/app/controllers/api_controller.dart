import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_app_task/app/local/hive_boxes.dart';
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
      final response = await http.get(url, headers: header);
      // log(response.body);
      if (response.statusCode == 200) {
        await HiveBoxs.currentWeather
            .put("currentWeather", response.body)
            .then((value) => log('SyncDone.....'));

        currentWeather = currentWeatherFromJson(response.body);
        // log(currentWeather.location!.name.toString());
      }
      // return currentWeather;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      // return currentWeather;
    }
    return currentWeather;
  }

  ///==================== Get Forcast Weather [getForcastWeather] ===================
  static Future<ForcastModel> getForcastWeather(String location) async {
    ForcastModel forcastModel = ForcastModel();
    final url = Uri.parse("$baseUrl/forecast.json")
        .replace(queryParameters: {"q": location, "days": "8"});
    log(url.toString());
    try {
      final response = await http.get(url, headers: header);
      if (response.statusCode == 200) {
        await HiveBoxs.forCast
            .put("forCast", response.body)
            .then((value) => log('SyncDone.....'));
            
        forcastModel = forcastModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return forcastModel;
  }
}

// class WeatherApiClient {
//   static const String _baseUrl = "http://api.weatherapi.com/v1";
//   static const String _apiKey = "ed4e0f0b212346a3840202051242604";

//   Future<Map<String, dynamic>> _get(String path,
//       {Map<String, String>? params}) async {
//     try {
//       final url = Uri.parse("$_baseUrl$path").replace(queryParameters: params);
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         return {"success": true, "data": response.body};
//       } else {
//         return {
//           "success": false,
//           "error": "Failed to fetch data: ${response.statusCode}"
//         };
//       }
//     } catch (e) {
//       return {"success": false, "error": "Exception: $e"};
//     }
//   }

//   Future<Map<String, dynamic>> getCurrentWeather(String location) async {
//     final params = {"q": location, "aqi": "yes", "key": _apiKey};
//     return await _get("/current.json", params: params);
//   }

//   Future<Map<String, dynamic>> getForecastWeather(String location) async {
//     final params = {"q": location, "days": "8", "key": _apiKey};
//     return await _get("/forecast.json", params: params);
//   }
// }
