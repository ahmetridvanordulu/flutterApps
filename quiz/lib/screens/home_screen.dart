import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/models/sorular_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Soru> _Sorular = [
    Soru(
        id: "23",
        baslik: "Sarayın masrafları ne kadar",
        ayar: {"Saray noldu": true, "Çaldılar": false}) //  3:08
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaPlan,
      appBar: AppBar(
        backgroundColor: arkaPlan,
        shadowColor: Colors.white,
        elevation: 20,
        title: const Text("Quiz App"),
        centerTitle: true,
      ),
    );
  }
}
