part of 'home_bloc.dart';

class HomeState extends Equatable {
  final CurrentWeatherStatus currentWeatherStatus;
  const HomeState({required this.currentWeatherStatus});

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;

  HomeState copyWith({
    CurrentWeatherStatus? newCurrentWeatherStatus,
  }) {
    return HomeState(
      currentWeatherStatus: newCurrentWeatherStatus ?? currentWeatherStatus,
    );
  }
}
