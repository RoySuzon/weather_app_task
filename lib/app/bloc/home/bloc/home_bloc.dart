import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_task/app/controllers/api_controller.dart';
import 'package:weather_app_task/app/domain/repositories/home/home_repository.dart';
import 'package:weather_app_task/app/domain/services/network_service.dart';
import 'package:weather_app_task/app/local/hive_boxes.dart';
import 'package:weather_app_task/app/models/current_weather_model.dart';
import 'package:weather_app_task/app/models/forcastmodel.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) async {
      if (await NetworkService.checkInternetConnectivity()) {
        emit(HomeLoadingState());
        try {
          HomeRepository.currentWeather =
              await ApiController.getCurrentWeather("Dhaka");
          HomeRepository.forcastModel =
              await ApiController.getForcastWeather("Dhaka");
        } catch (message, stackTrace) {
          emit(HomeErrorState(
              message: message.toString(), stackTrace: stackTrace.toString()));
        }
        emit(HomeSucessState(
            currentWeatherData: HomeRepository.currentWeather,
            forcastData: HomeRepository.forcastModel));
      } else {
        if (HiveBoxs.currentWeatherBox.isNotEmpty &&
            HiveBoxs.forCastBox.isNotEmpty) {
        // print('object');
        log(HiveBoxs.currentWeatherBox.get(0));
        emit(HomeSucessState(
            currentWeatherData: currentWeatherFromJson(
                jsonEncode(HiveBoxs.currentWeatherBox.get(0).toString())),
            forcastData:
                forcastModelFromJson(jsonEncode(HiveBoxs.forCastBox.get(0)))));
        // } else {
        //   emit(HomeErrorState(
        //       message: "Please check the internet connection and try again!"));
        }
      }
    });
  }
}
