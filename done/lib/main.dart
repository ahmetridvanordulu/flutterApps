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
        scaffoldBackgroundColor: Colors.red,
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        appBarTheme:  AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black,fontSize: 23),
          color: Colors.redAccent
        ),

        buttonTheme: const ButtonThemeData(buttonColor: Colors.red),
        textTheme: const TextTheme(

           titleMedium: TextStyle(
             color: Colors.black
           ),
          titleLarge: TextStyle(
            color: Colors.white
          )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 4,
            backgroundColor: Colors.black
          )
      ),
      home: const ana2(),
    );
  }
}
