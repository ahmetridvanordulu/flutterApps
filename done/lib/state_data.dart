import 'package:flutter/material.dart';

class StateVerisi with ChangeNotifier {
  String ProSehir = "New york";

  void degistir(String yeniIsim){
    ProSehir = yeniIsim;
    notifyListeners();
  }

}
