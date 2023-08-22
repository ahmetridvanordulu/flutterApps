import 'package:burclar/burc_listesi.dart';
import 'package:burclar/route_generator.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: RouterGenerator.routeGenerator,
    );
  }
}
