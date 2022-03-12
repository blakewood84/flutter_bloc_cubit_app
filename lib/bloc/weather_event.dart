part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {
  const WeatherEvent();
}


class GetWeather extends WeatherEvent {
  const GetWeather(this.cityName): super();

  final String cityName;
}
