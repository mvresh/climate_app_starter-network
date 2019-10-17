import 'package:clima/network_helper.dart';
import 'package:clima/location_screen.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/weather_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location myLocation = Location();
  @override
  void initState() {

    // TODO: implement initState
    getCurrentLocation();
    super.initState();

  }

  void getCurrentLocation() async {
    try {
      await myLocation.getLocation();
    } catch (e) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "LOCATION",
        desc: "Location Permission required!",
        buttons: [
          DialogButton(
            child: Text(
              "Back",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pushReplacement((context),MaterialPageRoute(
              builder: (context) => CityScreen())),
            width: 120,
          )
        ],
      ).show();
    }

    fetchCityWeatherData();
  }

  void fetchCityWeatherData() async{

    print('api.openweathermap.org/data/2.5/weather?q=${locationController.text}&appid=202312172d4b56dfdf88fe347407052a');
    NetworkHelper cityHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=${locationController.text}&appid=202312172d4b56dfdf88fe347407052a');
    Map cityWeatherData = await cityHelper.fetchCityWeatherInfo();
    Navigator.pushReplacement(
        (context),
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                cityWeatherData
            )));

  }

  void fetchWeatherData() async {
    NetworkHelper helper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=202312172d4b56dfdf88fe347407052a');

    Map weatherData = await helper.fetchWeatherInfo();
    Navigator.pushReplacement(
        (context),
        MaterialPageRoute(
            builder: (context) => LocationScreen(
              weatherData
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}