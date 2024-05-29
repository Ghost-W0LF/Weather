// ignore_for_file: prefer_const_constructors

import 'package:api_app/model/model.dart';
import 'package:api_app/pages/service/service.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  //api key
  final _weatherService =
      WeatherService();
  Weather? _weather;
  //fetch Weather

  _fetchWeather(String cityName) async {
    //get current city
    String cityName = await _weatherService.getCurrentCity();
    //get weather for the city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _fetchWeather("Nepal");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 61, 134, 218),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //searchBAR
            Container(
             // padding: EdgeInsets.only(top: 50),
             
            ),

            //cityname
            Text(
              "${_weather?.city.name.toString() ?? " No city name......"}",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
           
            //DAY and time
              Row(children: [
              Padding(padding:EdgeInsets.only(left:150)),
                Text('${_weather?.list[7].dtTxt.day.toString() ?? "No time"}-',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),),
                Text('${_weather?.list[7].dtTxt.month.toString() ?? "No time"}-',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),),Text('${_weather?.list[7].dtTxt.year.toString() ?? "No time"}',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),),
                Text('  ${_weather?.list[7].sys.pod.name.toString() ?? "No time"}',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),),
              ],),
            

            //Image icon of weather
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://openweathermap.org/img/wn/${_weather?.list[2].weather[0].icon}@2x.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ));
  }
}

//Search bar
