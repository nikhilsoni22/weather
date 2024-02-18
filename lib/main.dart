import 'package:flutter/material.dart';
import 'package:weather/Activity/home.dart';
import 'package:weather/Activity/loading.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) => Loading(),
      "/home": (context) => Home(), // loading se home jaa rha hai
      "/loading": (context) => Loading(), // home se loading jaa rha hai
    },
  ));
}