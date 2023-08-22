import 'package:burclar/burc_detay.dart';
import 'package:burclar/burc_listesi.dart';
import 'package:burclar/model/burc_model.dart';
import 'package:flutter/material.dart';
//-6
class RouterGenerator{
  static Route<dynamic>? routeGenerator(RouteSettings settings){
    switch(settings.name){
      case "/":
      return MaterialPageRoute(builder: (context) => BurcListesi(),);
      case '/burcDetay':

        return MaterialPageRoute(builder: (context) => BurcDetay(secilenBurc: settings.arguments as burcModeli,));
    }
  }
}