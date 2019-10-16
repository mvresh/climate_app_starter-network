import 'dart:convert';

import 'package:clima/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  void currentLocation() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<Map> fetchWeatherInfo() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    double latitude = position.latitude;
    double longitude = position.longitude;
    Map decodedResponse;
    Response response = await get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=4f7b32dc58f4ac156caec77d106358f8');

    if(response.statusCode == 200){
      decodedResponse = jsonDecode(response.body);
    }
    return decodedResponse;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
//                  child: Icon(
//                    Icons.arrow_back_ios,
//                    size: 50.0,
//                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              FlatButton(
                onPressed: () async{
                  Map dataFinal = await fetchWeatherInfo();
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => LocationScreen(dataFinal)));
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Spartan MB',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}