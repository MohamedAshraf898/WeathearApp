import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethear_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wethear_app/main.dart';
import 'package:wethear_app/models/weather_model.dart';

class Weatherinfodata extends StatelessWidget {
  const Weatherinfodata({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel model = BlocProvider.of<GetWeatherCubit>(context).model!;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            getThemColor(model.condition),
            getThemColor(model.condition)[200]!,
            getThemColor(model.condition)[100]!,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              model.cityname,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Updated at ${model.date.hour}:${model.date.minute}',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.temp.round().toString(),
                  style: TextStyle(fontSize: 100),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Icon(
                    Icons.circle_outlined,
                    weight: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage('https:${model.image}'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  model.condition,
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  model.maxtemp.round().toString(),
                  style: TextStyle(fontSize: 18),
                ),
                Text('/'),
                Text(
                  model.mintemp.round().toString(),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 270,
            ),
          ],
        ),
      ),
    );
  }
}
