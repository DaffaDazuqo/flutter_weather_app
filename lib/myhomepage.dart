import 'package:flutter/material.dart';
import 'package:flutter_weather_app/services/weather_services.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  final weather;

  MyHomePage(this.weather);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic weatherData;
  String cityName;
  int temperature;
  int tempMax;
  int tempMin;
  int humidity;
  double visibilityDouble;
  int visibility;
  double pressure;
  String weatherName;
  String city;

  @override
  void initState() {
    weatherData = widget.weather;
    updateUI();
    super.initState();
  }

  updateUI() {
    if (weatherData == null) {
      temperature = 0;
      tempMax = 0;
      tempMin = 0;
      humidity = 0;
      visibility = 0;
      pressure = 0;
      weatherName = "weather";
      city = "Location";
    }
    tempMin = weatherData['main']['temp_min'].toInt();
    tempMax = weatherData['main']['temp_max'].toInt();
    humidity = weatherData['main']['humidity'].toInt();
    visibilityDouble = weatherData['visibilityDouble'].toInt() / 1000;
    visibility = visibilityDouble.toInt();
    temperature = weatherData['main']['temp'].toInt();
    weatherName = weatherData['weather'][0]["main"];
    city = weatherData['name'];
    pressure = weatherData['main']['pressure'].toInt() / 1000;
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = new DateFormat('E, d MM');
    String formattedDate = formatter.format(now);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            WeatherServices().getWeatherBackground(
                                weatherData['weather'][0]['main'].toString()
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 140, right: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formattedDate,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                temperature.toString(),
                                style: TextStyle(
                                    fontSize: 100, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                  "°C",
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            weatherName,
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0x80FFFFFF),
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Current Details"),
                                  SizedBox(
                                    height: 24.0,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Temp Max'),
                                            Text('Temp Min'),
                                            Text('Humidity'),
                                            Text('Pressure'),
                                            Text('Visibility'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(tempMax.toString() + "°C"),
                                            Text(tempMin.toString() + "°C"),
                                            Text(humidity.toString() + "%"),
                                            Text(pressure.toString() + "nbar"),
                                            Text(visibility.toString() + " km"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, right: 8.0, left: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: null),
                          Text(
                            city,
                            style: TextStyle(fontSize: 26, color: Colors.white),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.location_on,
                              color: Colors.transparent,
                            ),
                            onPressed: null),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
