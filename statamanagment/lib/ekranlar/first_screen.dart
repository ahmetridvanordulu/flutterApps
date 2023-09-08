import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statamanagment/providers/sayac_provider.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.height * 0.08;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${Provider.of<SayacProvider>(context).sayi}",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: media,
            ),
            OutlinedButton(
                onPressed: () =>
                    Provider.of<SayacProvider>(context,listen: false).sayaciArttir(),
                child: Text("Arttır ++")),
            SizedBox(
              height: media,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "second");
                },
                child: const Text("Diğer sayfa"))
          ],
        ),
      ),
    );
  }
}
