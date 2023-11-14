part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadCurrentWeatherEvent extends HomeEvent {
  final String cityName;

  const LoadCurrentWeatherEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}
