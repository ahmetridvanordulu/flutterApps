import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turkiyetakvimi/model/yaprakModel.dart';
import 'package:turkiyetakvimi/view/home_screen.dart';
import 'package:turkiyetakvimi/view/loading_screen.dart';
import 'package:html/parser.dart';

import 'model/model.dart';

void main() {

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/home': (context) => HomeScreen(
          prayerTimeModel: Vakit(),
          arkayuzModel: Yaprak(),
          cityName: '',
        ),
      },
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}