import 'package:api_app/model/model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {

  final String url = "https://api.openweathermap.org/data/2.5/forecast?";

  WeatherService();
  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse(
        "${url}q=$cityName&appid=41d6c844e7f5311423511fb9ffaae87b"));
    if (response.statusCode == 200) {
     print(response.body);
      return Weather.fromJson(json.decode(response.body));
      

     
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<String> getCurrentCity() async {
    //get permission from user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    //Fetch current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    //convert the ocation into a place mark object

    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //extract teh city name from first placemark
    String? city = placeMark[0].locality;
    return city ?? " ";
  }
}
