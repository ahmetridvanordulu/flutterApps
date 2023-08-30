import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

    String? title;
    String? isdone;

    ItemCard({this.title,this.isdone})





  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: ListTile(
        title: Text("Spora git",
            style: TextStyle(color: Colors.black87, fontSize: 20)),
        trailing: Checkbox(
          onChanged: (value) {

          },
          value: false,
          activeColor: Colors.orangeAccent,
        ),
      ),
    );
  }
}
