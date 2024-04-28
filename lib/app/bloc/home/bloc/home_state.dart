part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSucessState extends HomeState {
  final CurrentWeather currentWeatherData;
  final ForcastModel forcastData;

  HomeSucessState(
      {required this.currentWeatherData, required this.forcastData});
}

class HomeErrorState extends HomeState {
  final String? message;
  final String? stackTrace;

  HomeErrorState({this.message, this.stackTrace});
}

// enum BlocState { initial, loading, success, error }

// getState() {
//   switch (BlocState) {
//     case BlocState.initial:
//       HomeInitiState();
//     default:
//       HomeErrorState();
//   }
// }
