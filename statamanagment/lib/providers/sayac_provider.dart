import 'package:flutter/cupertino.dart';

class SayacProvider with ChangeNotifier{ // sayıyı değiştirdiğimizi bildiriyor
  int sayi = 2;

  sayaciArttir(){
    sayi * 44;
    notifyListeners();
  }
}