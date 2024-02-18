
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    super.initState();

    print('this is a init state');
  }

  @override
  Widget build(BuildContext context) {
    var city_name = [
      "Mumbai",
      "Delhi",
      "Chennai",
      "Indore",
      "London",
      "jodhpur"
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    
    
    String temp = ((info['temp_value']).toString());
    String air = ((info['air_speed_value']).toString());
    if(temp=="NA")
      {
        print('NA');
        
      }
    else
      {
        temp = ((info['temp_value']).toString()).substring(0,4);
        air = ((info['air_speed_value']).toString()).substring(0,4);
        
      }
    
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String humidity = info['hum_value'];
    
    String des = info["des_value"];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.blue.shade300],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              children: [
                Container(
                  //search wala container
        
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "") == ""){
        
                            print("Blank search");
                          }else{
                            Navigator.pushReplacementNamed(context, "/loading",arguments: {
                              "searchText" : searchController.text,
                            });
                          }
        
                        }, // yha prr kuch aa skta ha
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              hintText: "Search $city", border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network('https://openweathermap.org/img/wn/$icon@2x.png'),  //baad me link  dalni hogi tb kholna
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              children: [
                                Text(
                                  '$des',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'In $getcity',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          //bada wala container..........
                          height: 230,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(14)),
                          margin:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          padding: EdgeInsets.all(26),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.thermometer),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$temp',
                                    style: TextStyle(fontSize: 90),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(WeatherIcons.celsius,size: 40,),
                                    
        
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        // 1st chota wala box.......................
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        margin: EdgeInsets.fromLTRB(27, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '$air',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text('km/hr')
                          ],
                        ),
                        height: 150,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // 2nd chota wala box............................
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        margin: EdgeInsets.fromLTRB(10, 0, 27, 0),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '$humidity',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text('percent')
                          ],
                        ),
                        height: 150,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Made By Nikhil Soni'),
                      Text("Data Provided By Openweathermap.org"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
