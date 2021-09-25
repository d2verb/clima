import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    final weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

// void getData(double latitude, double longtitude) async {
//   final String? apiKey = dotenv.env['OPEN_WEATHER_API_KEY'];
//   final Response response = await get(Uri.https(
//     'api.openweathermap.org',
//     '/data/2.5/weather',
//     {
//       'lat': latitude.toStringAsFixed(2),
//       'lon': longtitude.toStringAsFixed(2),
//       'appid': apiKey,
//     },
//   ));

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     final temperature = data['main']['temp'];
//     final condition = data['weather'][0]['id'];
//     final cityName = data['name'];
//     print([temperature, condition, cityName]);
//   } else {
//     print(response.statusCode);
//   }
// }
