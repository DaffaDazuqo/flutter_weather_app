import 'package:flutter_weather_app/services/network_helper.dart';

const apiKey = "3fac717b5b1ae885a81242634f24dbda";
const apiUrl = "http://api.openweathermap.org/data/2.5/weather";

class WeatherServices {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$apiUrl?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherBackground(String condition) {
    switch (condition) {
      case "Rain":
        return "https://wallpaperaccess.com/full/1541565.jpg";
      case "Thunderstorm":
        return "https://cdn.wallpapersafari.com/49/78/prPxAF.png";
      case "Drizzle":
        return "https://papers.co/wallpaper/papers.co-vs83-raindrop-simple-texture-pattern-dark-bw-41-iphone-wallpaper.jpg";
      case "Snow":
        return "https://i.pinimg.com/originals/84/21/dd/8421dd880ea4d82ab5b4396396dd94c1.jpg";
      case "Clear":
        return "https://image.winudf.com/v2/image/Y29tLnR1bXBlbmduZXQud2FsbHBhcGVyY2xvdWRfc2NyZWVuc2hvdHNfNl9iNjEyZmZiYw/screen-6.jpg?fakeurl=1&type=.jpg";
      case "Clouds":
        return "https://i.pinimg.com/originals/01//87/ed/0187edc1e79466297ff744a8d1c61fb4.jpg";
      case "Atmosphere":
        return "https://i2.wp.com/www.3wallpapers.fr/wp-content/uploads/2018/08/iPhone-wallpaper-fog-mount-tamalpais.png";
      default :
        return "https://i2.wp.com/www.3wallpapers.fr/wp-content/uploads/2018/08/iPhone-wallpaper-fog-mount-tamalpais.png";
    }
  }
}
