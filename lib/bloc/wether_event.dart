part of 'wether_bloc.dart';

sealed class WetherEvent extends Equatable {
  const WetherEvent();
}

class FeatchWeather extends WetherEvent {
  final Position position;

  const FeatchWeather(this.position);

  @override
  List<Object?> get props => [position];
}

