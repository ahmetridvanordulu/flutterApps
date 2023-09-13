import 'package:flutter/material.dart';

class aylarKarti extends StatelessWidget {
  aylarKarti({super.key, required this.option,required this.renk,required this.degissin});

  String option;
  Color renk;
  VoidCallback degissin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  degissin,
      child  : Card(
        color: renk,
        child: ListTile(
          title: Text(
            option,
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
