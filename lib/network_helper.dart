import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper{
  String url;
  NetworkHelper(this.url);

  Future<Map> fetchWeatherInfo() async{

    Map decodedResponse;
    Response response = await get(url);

    if(response.statusCode == 200){
      decodedResponse = jsonDecode(response.body);
    }
    return decodedResponse;


  }

  Future<Map> fetchCityWeatherInfo() async{

    Map decodedResponse;
    Response response = await get(url);

    if(response.statusCode == 200){
      decodedResponse = jsonDecode(response.body);
    }
    return decodedResponse;


  }
}