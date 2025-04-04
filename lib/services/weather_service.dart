import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wethear_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apikey = 'db6a10ca02d7467baf6162722240909';
  WeatherService({required this.dio});
  Future<WeatherModel> get({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apikey%20&q=$city&days=1');
      return WeatherModel.fromjson(response.data);
    } on DioException catch (e) {
      final String error = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(error);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
