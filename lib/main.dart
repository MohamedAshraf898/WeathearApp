import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethear_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wethear_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:wethear_app/screens/Home_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemColor(
                    BlocProvider.of<GetWeatherCubit>(context).model?.condition),
              ),
              home: HomePage(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.yellow;
    case 'Partly cloudy':
      return Colors.orange;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Patchy light rain':
    case 'Moderate or heavy rain shower':
    case 'Light rain shower':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Patchy light snow':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.grey;
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.indigo;
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blueGrey;
    case 'Fog':
      return Colors.teal;
    case 'Freezing fog':
      return Colors.purple;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.grey; // Default color if condition is not found
  }
}
