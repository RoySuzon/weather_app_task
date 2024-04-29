import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_task/app/controllers/api_controller.dart';
import 'package:weather_app_task/app/domain/repositories/home/home_repository.dart';
import 'package:weather_app_task/app/domain/services/network_service.dart';
import 'package:weather_app_task/app/local/hive_boxes.dart';
import 'package:weather_app_task/app/models/current_weather_model.dart';
import 'package:weather_app_task/app/models/forcastmodel.dart';
import 'package:weather_app_task/app/utils/toast_utils.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    late String location;
    on<HomeInitialEvent>((event, emit) async {
      location = event.location ?? "Dhaka";
      emit(HomeLoadingState());

      await Future.delayed(const Duration(seconds: 2));
      if (await NetworkService.checkInternetConnectivity()) {
        try {
          HomeRepository.currentWeather =
              await ApiController.getCurrentWeather(location);
          HomeRepository.forcastModel =
              await ApiController.getForcastWeather(location);
        } catch (message, stackTrace) {
          emit(HomeErrorState(
              message: message.toString(), stackTrace: stackTrace.toString()));
        }
        emit(HomeSucessState(
            currentWeatherData: HomeRepository.currentWeather,
            forcastData: HomeRepository.forcastModel));
      } else {
        if (HiveBoxs.currentWeather.isNotEmpty && HiveBoxs.forCast.isNotEmpty) {
          ToastUtils.showToast(
              "Plesae check the internet!\nIt's Running On Offline!",
              Colors.red);
          emit(HomeSucessState(
              currentWeatherData: currentWeatherFromJson(
                  await HiveBoxs.currentWeather.get("currentWeather")),
              forcastData:
                  forcastModelFromJson(await HiveBoxs.forCast.get("forCast"))));
        } else {
          emit(HomeErrorState(message: "Plesae check the internet!"));
        }
      }
    });
  }

  // _homeInitialEvent(event, emit) async {
  //   emit(HomeLoadingState());
  //   await Future.delayed(const Duration(seconds: 2));
  //   if (await NetworkService.checkInternetConnectivity()) {
  //     try {
  //       HomeRepository.currentWeather =
  //           await ApiController.getCurrentWeather("Dhaka");
  //       HomeRepository.forcastModel =
  //           await ApiController.getForcastWeather("Dhaka");
  //     } catch (message, stackTrace) {
  //       emit(HomeErrorState(
  //           message: message.toString(), stackTrace: stackTrace.toString()));
  //     }
  //     emit(HomeSucessState(
  //         currentWeatherData: HomeRepository.currentWeather,
  //         forcastData: HomeRepository.forcastModel));
  //   } else {
  //     if (HiveBoxs.currentWeather.isNotEmpty && HiveBoxs.forCast.isNotEmpty) {
  //       ToastUtils.showToast(
  //           "Plesae check the internet!\nIt's Running On Offline!", Colors.red);
  //       emit(HomeSucessState(
  //           currentWeatherData: currentWeatherFromJson(
  //               await HiveBoxs.currentWeather.get("currentWeather")),
  //           forcastData:
  //               forcastModelFromJson(await HiveBoxs.forCast.get("forCast"))));
  //     } else {
  //       emit(HomeErrorState(message: "Plesae check the internet!"));
  //     }
  //   }
  // }
}
