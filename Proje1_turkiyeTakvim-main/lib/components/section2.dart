import 'package:flutter/material.dart';
import 'package:turkiyetakvimi/components/prayer_info_section.dart';

import '../constant.dart';
import 'my_divider.dart';

class Section2 extends StatefulWidget {
  String israk;
  String israkVakti;
  String gunes;
  String gunesVakti;
  String imsak;
  String imsakVakti;
  String sabah;
  String sabahVakti;
  String ogle;
  String ogleVakti;
  String ikindi;
  String ikindiVakti;
  String aksam;
  String aksamVakti;
  String yatsi;
  String yatsiVakti;
  String kible;
  String kibleVakti;
  String cityName;
  String currentPrayerTime;

  Section2({
    this.israk = 'xx',
    this.israkVakti = 'xx',
    this.gunes = 'xx',
    this.gunesVakti = 'xx',
    this.imsak = 'xx',
    this.imsakVakti = 'xx',
    this.sabah = 'xx',
    this.sabahVakti = 'xx',
    this.ogle = 'xx',
    this.ogleVakti = 'xx',
    this.ikindi = 'xx',
    this.ikindiVakti = 'xx',
    this.aksam = 'xx',
    this.aksamVakti = 'xx',
    this.yatsi = 'xx',
    this.yatsiVakti = 'xx',
    this.kible = 'xx',
    this.kibleVakti = 'xx',
    this.cityName = 'xx',
    required this.currentPrayerTime,
  });

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            PrayerInfoSection(
              prayerTime: widget.imsakVakti,
              prayerTimeName: widget.imsak,
              isTheCurrent: false,
            ),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.sabahVakti,
              prayerTimeName: widget.sabah,
              isTheCurrent: widget.currentPrayerTime == widget.sabah,
            ),
            const MyDivider(),
            PrayerInfoSection(
                prayerTime: widget.gunesVakti,
                prayerTimeName: widget.gunes,
                isTheCurrent: false),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.israkVakti,
              prayerTimeName: widget.israk,
              isTheCurrent: false,
            ),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.ogleVakti,
              prayerTimeName: widget.ogle,
              isTheCurrent: widget.currentPrayerTime == widget.ogle,
            ),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.ikindiVakti,
              prayerTimeName: widget.ikindi,
              isTheCurrent: widget.currentPrayerTime == widget.ikindi,
            ),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.aksamVakti,
              prayerTimeName: widget.aksam,
              isTheCurrent: widget.currentPrayerTime == widget.aksam,
            ),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.yatsiVakti,
              prayerTimeName: widget.yatsi,
              isTheCurrent: widget.currentPrayerTime == widget.yatsi,
            ),

            /*
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.kibleVakti,
              prayerTimeName: widget.kible,
              isTheCurrent: false,
            ),
            */
          ],
        ),
      ],
    );
  }
}
