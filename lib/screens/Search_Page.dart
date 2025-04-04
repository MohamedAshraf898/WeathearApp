import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethear_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wethear_app/models/weather_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search City'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 350),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onSubmitted: (value) async {
                  var weathercubit = BlocProvider.of<GetWeatherCubit>(context);
                  weathercubit.getWeather(cityname: value);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  labelText: 'Search',
                  hintText: 'Enter a city name',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

WeatherModel? model;
