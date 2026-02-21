import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'wether_event.dart';
part 'wether_state.dart';

class WetherBloc extends Bloc<WetherEvent, WeatherState> {
  WetherBloc() : super(WeatherLoading()) {
    on<FeatchWeather>((event, emit) async {
      try {
        WeatherFactory wf = WeatherFactory(
          "6bdb86ab75553d7c488816f65e19d817",
          language: Language.ENGLISH,
        );
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        emit(WeatherSucces(weather: weather));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}
