import 'package:done/screens/ana.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ana());
}

class ana extends StatelessWidget {
  const ana({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.cyan,
        primarySwatch: Colors.cyan,
        primaryColor: Colors.cyan,
        appBarTheme:  AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 30),
          color: Colors.cyan
        ),

        buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
        textTheme: const TextTheme(

           titleMedium: TextStyle(
             color: Colors.red,
             fontSize: 30,fontWeight: FontWeight.bold
           ),
          titleLarge: TextStyle(
            color: Colors.white
          )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 4,
            backgroundColor: Colors.cyan
          )
      ),
      home: const ana2(),
    );
  }
}
