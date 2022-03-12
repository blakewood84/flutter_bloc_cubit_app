import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';
import 'package:meta/meta.dart';
import 'weather_state.dart';

part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this._weatherRepository) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if(event is GetWeather) {
        try {
          emit(WeatherLoading());
          final weather = await _weatherRepository.fetchWeather(event.cityName);
          emit(WeatherLoaded(weather));
        } on NetworkException {
          emit(WeatherError('Could not fetch weather!'));
        }
      }
    });  
  }

  final WeatherRepository _weatherRepository;
}
