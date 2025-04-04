class WeatherModel {
  final String cityname;
  final DateTime date;
  final double temp;
  final double mintemp;
  final double maxtemp;
  final String image;
  final String condition;

  WeatherModel(
      {required this.cityname,
      required this.date,
      required this.temp,
      required this.mintemp,
      required this.maxtemp,
      required this.image,
      required this.condition});
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      cityname: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
