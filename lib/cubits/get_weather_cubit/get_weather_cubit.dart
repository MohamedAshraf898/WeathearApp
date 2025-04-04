import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethear_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:wethear_app/models/weather_model.dart';

import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherinfoState());
  WeatherModel? model;
  getWeather({required String cityname}) async {
    try {
      model = await WeatherService(dio: Dio()).get(city: cityname);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFaliureState());
    }
  }
}
