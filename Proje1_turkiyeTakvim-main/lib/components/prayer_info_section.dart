import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:turkiyetakvimi/constant.dart';

class PrayerInfoSection extends StatefulWidget {





  PrayerInfoSection({
    required this.prayerTimeName,
    required this.prayerTime,
    required this.isTheCurrent,
  });

  String prayerTimeName = '';
  String prayerTime = '';
  bool isTheCurrent = false;

  @override
  State<PrayerInfoSection> createState() => _PrayerInfoSectionState();
}

class _PrayerInfoSectionState extends State<PrayerInfoSection> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 30,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isTheCurrent?Colors.deepOrange[200]:Colors.transparent,
          border: Border.all(color: Colors.black,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              AutoSizeText(
                '${widget.prayerTime}',
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                maxLines: 2,
                minFontSize: 1,
                overflow: TextOverflow.ellipsis,
              ),

              AutoSizeText(
                ': ${widget.prayerTimeName}',
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                maxLines: 2,
                minFontSize: 1,
                overflow: TextOverflow.ellipsis,
              )



            ],
          ),
        ),
      ),
    );
  }
}

