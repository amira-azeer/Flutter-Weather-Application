import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import './HomePage.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  var homePageUserInput = new HomePage();
  var temp; //unsure of the data type thus var is used
  var description;
  var currently;
  var humidity;
  var windspeed;
  var country = "London";


  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=${country}&appid={API KEY}"));
    
    var results =
    jsonDecode(response.body); //extracting details from the json file
    setState(() {
      this.temp = results["main"]["temp"];
      this.description = results["weather"][0]["description"];
      this.currently = results["weather"][0]["main"];
      this.humidity = results["main"]["humidity"];
      this.windspeed = results["wind"]["speed"];
      this.country = results["sys"]["country"];
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 3,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //centers the red container
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    country != null
                        ? "Currently in " + country.toString()
                        : "Loading",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  temp != null ? temp.toString() + "\u00B0" : "Loading",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 40.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "Loading",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                      title: const Text("Temperature"),
                      trailing: Text(
                          temp != null
                              ? temp.toString() + "\u00B0"
                              : "Loading"),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloud),
                      title: const Text("Weather"),
                      trailing: Text(
                          description != null
                              ? description.toString()
                              : "Loading"),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.sun),
                      title: const Text("Humidity"),
                      trailing:
                      Text(humidity != null ? humidity.toString() : "Loading"),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.wind),
                      title: const Text("Wind Speed"),
                      trailing: Text(
                          windspeed != null ? windspeed.toString() : "Loading"),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

