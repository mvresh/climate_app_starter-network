import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'loading_screen.dart';

TextEditingController locationController = TextEditingController();

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {


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
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(flex:1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FlatButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.location_city,
                            size: 20.0,
                        ),
                      ),
                  ),
                    ),
                    Expanded(flex:5,
                      child: TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 2.0),
                        ),

                      ),),)

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              FlatButton(
                onPressed: () async{
                  try{
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => LoadingScreen()));}
                          //LocationScreen(dataFinal)
                  catch(error){
                    Alert(context: context, title: "LOCATION", desc: "Permission is required!").show();
                  }
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
