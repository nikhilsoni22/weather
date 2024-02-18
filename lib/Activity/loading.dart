import 'package:flutter/material.dart';
import 'package:weather/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

 String? city = 'jodhpur';
String? temp;
String? humidity;
String? air_speed;
String? des;
String? main;
String? icon;
  void startApp(String? city) async {
    worker instance = worker(location: city);
    await instance.getData();

    temp =  instance.temp;
    humidity = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context as BuildContext, '/home', arguments: {
        "temp_value" : temp,
        "hum_value" : humidity,
        "air_speed_value" : air_speed,
        "main_value" : main,
        "icon_value" : icon,
        "city_value" : city,
        "des_value" : des,
      });
    });

  }
@override
  void initState() {

    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    Map? searchvalue = ModalRoute.of(context)?.settings. arguments as Map?;

    if(searchvalue?.isNotEmpty ?? false)
      {
         city = searchvalue!['searchText'];

      }
    startApp(city);
    return Scaffold(
        body: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Image.asset("assets/images/Weather.logo4.webp",height: 200,width: 200,),
          SizedBox(
            height: 40,
          ),

              Text("Weather",style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(
                height: 10,
              ),
              Text('Made by Nikhil Soni',style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),),
              SpinKitThreeBounce(
                size: 30,
                color: Colors.blue,

              )

            ],
          ),
        ),
      backgroundColor: Colors.blue.shade200,
    );
  }
}
