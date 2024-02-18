import 'package:http/http.dart';
import 'dart:convert';
class worker {
  String? location;

  //Constructor

  worker({this.location}) {
    location = this.location;
  }

  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  Future<void> getData() async
  {

    try{
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=1fe99f9c739763ce08b2c3630e0dd3e1"));
      Map data = jsonDecode(response.body);
          print(data);
      //Getting temp,humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      //Getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind["speed"]/0.27777777777778;

      //Getting description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];


      //assigning value
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc.toString();
      main = getMain_des;
      icon = weather_main_data['icon'].toString();
    }catch(e){
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data";
      main ="NA";
      icon = '04d';
    }

  }
}
