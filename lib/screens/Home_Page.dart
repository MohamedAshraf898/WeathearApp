import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethear_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wethear_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:wethear_app/screens/NoWeatherinfo.dart';
import 'package:wethear_app/screens/WeatherInfoData.dart';

import 'Search_Page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Weather App",
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }));
                },
                icon: Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
            ]),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherinfoState) {
              return NoWeatherdata();
            } else if (state is WeatherLoadedState) {
              return Weatherinfodata();
            } else {
              return Center(child: Text('Opps There Was An Error'));
            }
          },
        ));
  }
}
