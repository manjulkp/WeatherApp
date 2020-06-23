import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() async {

  Map data = await getAllData();

//  print("Result of json is ${data['list'][0]['main']['temp']}");

  runApp(new MaterialApp(
      home: new Scaffold(
    appBar: new AppBar(
      title: new Text("Weather Application"),
      backgroundColor: Colors.amber,
    ),
        body: new Container(
          height: 800.0,
          color:Colors.deepOrange ,
          child: new Stack(
            children: <Widget>[
              new Container(
                height: 800.0,
                child: new Image(image:AssetImage("asset/weather.jpg"),
                  alignment: Alignment.topCenter,
                //fit:BoxFit.cover,
                ),

              ),

              new Positioned(

                bottom:50.0,

                child:new Container(
                  height: 100.0,
                  width:400.0,
                  color:Colors.deepOrange,
                  margin: EdgeInsets.all(10.0),
                  child: new Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Center(
                        child: new Text("The Temperature ${data['list'][0]['main']['temp']}".toString()+"/F",
                        style: TextStyle(fontSize: 20.0,
                        color: Colors.white),
                        ),
                      )
                    ],
                  )
                )




              )

            ],
          ),
        ),
  )));
}

Future<Map> getAllData() async {
  var api =
      "https://samples.openweathermap.org/data/2.5/forecast/hourly?id=524901&appid=439d4b804bc8187953eb36d2a8c26a02";
  var data = await http.get(api);

  var jsonData = json.decode(data.body);
  return jsonData;
}
