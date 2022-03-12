import 'package:flutter/foundation.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';


@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial() : super();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(this.weather);
  final Weather weather;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WeatherLoaded &&
      other.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;

}


class WeatherError extends WeatherState {
  const WeatherError(this.message);
  final String message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WeatherError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
