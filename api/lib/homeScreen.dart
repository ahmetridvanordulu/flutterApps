import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as internetPaketi;

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api call"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: kullanicilariCek,
      ),
    );
  }

  void kullanicilariCek() async {
    print("Kullanıcılar çekildi");
    var url = await Uri.parse("https://randomuser.me/api/?results=25");
    var cevap = await internetPaketi.get(url);
    var badisi = cevap.body;
    var jsonadonmushali = jsonDecode(badisi);
    //6:00 https://www.youtube.com/watch?v=ExPFnu8Dm40&list=PLXbYsh3rUPSzuLcZsIkpDmftSQbFmUq9x
  }
}
