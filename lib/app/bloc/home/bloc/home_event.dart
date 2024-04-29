// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {
  final String? location;
  HomeInitialEvent({
    this.location,
  });

  // HomeInitialEvent(this.currentWeatherData, this.forcastData);
}
// class HomeInitial extends HomeEvent {}
