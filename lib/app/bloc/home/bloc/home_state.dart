part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSucessState extends HomeState {}

class HomeErrorState extends HomeState {}

// enum BlocState { initial, loading, success, error }

// getState() {
//   switch (BlocState) {
//     case BlocState.initial:
//       HomeInitiState();
//     default:
//       HomeErrorState();
//   }
// }
