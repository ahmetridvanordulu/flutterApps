import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statamanagment/providers/sayac_provider.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${Provider.of<SayacProvider>(context).sayi}",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            IconButton(
                onPressed: () {
                  Provider.of<SayacProvider>(context,listen: false).sayaciArttir();
                },
                icon: Icon(Icons.exposure_plus_1))
          ],
        ),
      ),
    );
  }
}
