import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

    String? baslik;
    bool? yapildimi;


   ItemCard({this.baslik,this.yapildimi,super.key});






  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: ListTile(
        title: Text(baslik!,
            style: TextStyle(fontSize: 16, color: Colors.black87)),
        trailing: Checkbox(
          activeColor: Colors.red,
          onChanged: (value) {

          },
          value: yapildimi,
        ), // 5 22
      ),
    );
  }
}
