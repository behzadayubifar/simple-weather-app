part of 'home_bloc.dart';

class HomeState extends Equatable {
  final CwStatus cwStatus;
  final FwStatus fwStatus;

  const HomeState({required this.cwStatus, required this.fwStatus});
  @override
  List<Object> get props => [cwStatus];

  @override
  bool get stringify => true;

  HomeState copyWith(
      {CwStatus? newCurrentWeatherStatus, FwStatus? newFwStatus}) {
    return HomeState(
      cwStatus: newCurrentWeatherStatus ?? cwStatus,
      fwStatus: newFwStatus ?? fwStatus,
    );
  }
}
