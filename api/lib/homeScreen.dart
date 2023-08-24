import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as internetPaketi;

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  TextStyle yazi = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent);
  List<dynamic> kullaniciListesi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api call"),
      ),
      body: ListView.builder(
        itemCount: kullaniciListesi.length,
        itemBuilder: (context, index) {
          final kullanici = kullaniciListesi[index];
          var mail = kullanici["email"];
          var resmi = kullanici["picture"]["large"];
          var name = kullanici["name"]["first"];

          return ListTile(
            leading: Image.network(resmi), //11:14
            title: Text(name.toString(), style: yazi),
            subtitle: Text(mail,style: yazi),


          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: kullanicilariCek,
      ),
    );
  }

  void kullanicilariCek() async {
    var url = await Uri.parse("https://randomuser.me/api/?results=50");
    var cevap = await internetPaketi.get(url);
    var badisi = cevap.body;
    var jsonadonmushali = jsonDecode(badisi);

    kullaniciListesi = await jsonadonmushali["results"];

    setState(() {});
  }
}
