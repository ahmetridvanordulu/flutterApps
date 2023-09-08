import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/models/sorular_model.dart';
import 'package:quiz/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Soru> _Sorular = [
    Soru(
        id: "1",
        baslik: "3 + 3 Kaç eder",
        ayar: {"4": false, "6": true, "11": false}),
    Soru(             // 4:33
        id: "2",
        baslik: "Türkiye Cumhurbaşkanı kimdir ?",
        ayar: {"Erdoğan": true, "Kılıçtaroğlu": false, "Akşener": true}),
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
