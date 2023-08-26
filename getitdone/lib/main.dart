import 'package:flutter/material.dart';
import 'package:getitdone/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
         primaryColor: Colors.deepOrange,
         primarySwatch: Colors.deepOrange,
         scaffoldBackgroundColor: Colors.deepOrange,
         appBarTheme: AppBarTheme(color: Colors.deepOrange),
         visualDensity: VisualDensity.adaptivePlatformDensity,
         textTheme: TextTheme(
           headlineLarge: TextStyle(color: Colors.white)
         )//6:48
       ),
          home: HomePage(),
    );
  }
}
