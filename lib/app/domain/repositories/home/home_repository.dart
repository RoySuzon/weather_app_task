import 'package:flutter/material.dart';
import 'package:weather_app_task/app/controllers/api_controller.dart';
import 'package:weather_app_task/app/models/current_weather_model.dart';
import 'package:weather_app_task/app/models/forcastmodel.dart';
import 'package:weather_app_task/app/utils/toast_utils.dart';

class HomeRepository {
  static CurrentWeather currentWeather = CurrentWeather();
  static ForcastModel forcastModel = ForcastModel();

  getCurrentWeatherData(String location) async {
    try {
      currentWeather = await ApiController.getCurrentWeather(location);
    } catch (e) {
      ToastUtils.showToast("$e", Colors.red);
    }
  }

  getForcastData(String location) async {
    try {
      forcastModel = await ApiController.getForcastWeather(location);
    } catch (e) {
      ToastUtils.showToast("$e", Colors.red);
    }
  }
}
