import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turkiyetakvimi/components/timer.dart';
import 'package:turkiyetakvimi/model/yaprakModel.dart';
import 'package:turkiyetakvimi/view/takvimSayfasi.dart';

import '../constant.dart';
import '../model/model.dart';


class Section1 extends StatefulWidget {
   Section1({
    required this.nextPrayerTime,
    required this.vakit
  });

  final String nextPrayerTime;
  final String vakit;

  @override
  State<Section1> createState() => _Section1State();
}

class _Section1State extends State<Section1> {
  Timer? timer;
  String time = '';


  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => {
        setState(
          () {
            time = Time().uptadeTime(widget.nextPrayerTime);

          },
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AutoSizeText("${widget.vakit}ne kalan süre",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19),
            minFontSize: 1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          AutoSizeText(time,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19),
            minFontSize: 1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height /200,
          ),



        ],
      ),
    );
  }
}
