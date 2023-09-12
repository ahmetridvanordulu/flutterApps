import 'package:flutter/material.dart';

class aylarKarti extends StatelessWidget {
  aylarKarti({super.key, required this.option});

  String option;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("selam");
      },
      child: Card(
         child: ListTile(
          title: Text(  //https://www.youtube.com/watch?v=4jBxPyMLeVs&list=PLowRfKz1qoIII96X_sz7KyXoD9tgnDIyv&index=7 5:42
            option,
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
