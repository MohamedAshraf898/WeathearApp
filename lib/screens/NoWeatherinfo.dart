import 'package:flutter/material.dart';

class NoWeatherdata extends StatelessWidget {
  const NoWeatherdata({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Weather Data Here 😔 please",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Try To Search 🔍",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 280,
          )
        ],
      ),
    );
  }
}
