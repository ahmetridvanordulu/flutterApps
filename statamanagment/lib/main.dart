import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statamanagment/ekranlar/first_screen.dart';
import 'package:statamanagment/ekranlar/second.dart';
import 'package:statamanagment/providers/sayac_provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SayacProvider(),
        ),
      ],
      child: const selam(),
    ));

class selam extends StatelessWidget {
  const selam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => FirstScreen(),
        "second": (context) => const Second(),
      },
    );
  }
}
