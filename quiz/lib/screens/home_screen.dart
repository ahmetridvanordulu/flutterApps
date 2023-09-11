import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/models/sorular_model.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/widgets/next_button.dart';
import 'package:quiz/widgets/question_widget.dart';

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
    Soru(

        id: "2",
        baslik: "Türkiye Cumhurbaşkanı kimdir ?",
        ayar: {"Erdoğan": true, "Kılıçtaroğlu": false, "Akşener": true}),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var xes = MediaQuery.of(context).size.height * 0.05;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child:  NextButton(), // 6:38
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: arkaPlan,
      appBar: AppBar(
        backgroundColor: arkaPlan,
        shadowColor: Colors.white,
        elevation: 20,
        title: const Text("Quiz App"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: xes,),
            QuestionWidget(
                question: _Sorular[index].baslik!,
                indexAction: index,
                totalQuestions: _Sorular.length),
             Divider(
              color: dogalRenk,
              height: xes,
            )
          ],
        ),
      ),
    );
  }
}
