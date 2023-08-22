import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_api/detayliBilgi/detayliBilgi.dart';

// custom widget üretiyoruz
Widget? suankiSicaklik(
    IconData icon, String temp, String location, BuildContext context) {
  return Center(
    child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Icon(
          icon,
          size: 64,
          color: Colors.cyanAccent,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Text(
          "$temp",
          style: TextStyle(fontSize: 40),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Text("$location",style: TextStyle(fontSize: 30,color: CupertinoColors.systemPink),),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Text("Detaylı bilgi",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
        Divider(
          color: Colors.red,
          thickness: 4.1,
          height:  MediaQuery.of(context).size.height /20,
        ),


      ],
    ),
  );
}
