import 'package:flutter/material.dart';
import 'package:flutter_weather_app/myhomepage.dart';
import 'package:flutter_weather_app/services/weather_services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getDataWeather();
    super.initState();
  }

  void getDataWeather() async {
    var weather = await WeatherServices().getCityWeather("Jakarta");
    print(weather);

    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage(weather))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Text(
              "🌤",
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}
