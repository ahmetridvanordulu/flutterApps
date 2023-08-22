import 'dart:async';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:turkiyetakvimi/model/yaprakModel.dart';
import 'package:turkiyetakvimi/view/loading_screen.dart';
import 'package:turkiyetakvimi/view/takvimSayfasi.dart';
import 'package:intl/intl.dart';

import '../components/section1.dart';
import '../components/section2.dart';
import '../model/model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(
      {required this.prayerTimeModel,
      required this.cityName,
      required this.arkayuzModel});

  final Vakit prayerTimeModel;
  final String cityName;
  final Yaprak arkayuzModel;

  @override
  _HomeScreenState createState() => _HomeScreenState();

  }


class _HomeScreenState extends State<HomeScreen> {

  var sayfaYenileme = Duration(minutes: 10);
  yenileme(){
    Future.delayed(sayfaYenileme,() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen(),));
    },);
  }


  String getWeekdayName(int weekday) {
    switch (weekday) {
      case 1:
        return "Pazartesi";
      case 2:
        return "Salı";
      case 3:
        return "Çarşamba";
      case 4:
        return "Perşembe";
      case 5:
        return "Cuma";
      case 6:
        return "Cumartesi";
      case 7:
        return "Pazar";
      default:
        return "";
    }
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return "OCAK";
      case 2:
        return "ŞUBAT";
      case 3:
        return "MART";
      case 4:
        return "NİSAN";
      case 5:
        return "MAYIS";
      case 6:
        return "HAZİRAN";
      case 7:
        return "TEMMUZ";
      case 8:
        return "AĞUSTOS";
      case 9:
        return "EYLÜL";
      case 10:
        return "EKİM";
      case 11:
        return "KASIM";
      case 12:
        return "ARALIK";
      default:
        return "";
    }
  }

  String currentPrayerTime = '';
  String nextPrayerTime = '';
  Timer? timer;

  String findTargetPrayerTime() {
    String currentTime = uptadeCurrentTime();

    if (currentTime == widget.prayerTimeModel.sabah) {
      nextPrayerTime = 'Öğle vakti';
      return widget.prayerTimeModel.ogle!;
    } else if (currentTime == widget.prayerTimeModel.ogle) {
      nextPrayerTime = 'İkindi vakti';
      return widget.prayerTimeModel.ikindi!;
    } else if (currentTime == widget.prayerTimeModel.ikindi) {
      nextPrayerTime = 'Akşam vakti';
      return widget.prayerTimeModel.aksam!;
    } else if (currentTime == widget.prayerTimeModel.aksam) {
      nextPrayerTime = 'Yatsı vakti';
      return widget.prayerTimeModel.yatsi!;
    } else {
      nextPrayerTime = 'Sabah vakti';
      return widget.prayerTimeModel.sabah!;
    }
  }

  String uptadeCurrentTime() {
    String a = '';
    if (DateTime.now().minute < 10) {
      a = '0';
    }
    int currentHour =
        int.parse("${DateTime.now().hour}$a${DateTime.now().minute}");

    if (currentHour >=
            int.parse(widget.prayerTimeModel.sabah!.replaceRange(2, 3, '')) &&
        currentHour <=
            int.parse(widget.prayerTimeModel.ogle!.replaceRange(2, 3, ''))) {
      return currentPrayerTime = widget.prayerTimeModel.sabah!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.ogle!.replaceRange(2, 3, '')) &&
        currentHour <=
            int.parse(widget.prayerTimeModel.ikindi!.replaceRange(2, 3, ''))) {
      return currentPrayerTime = widget.prayerTimeModel.ogle!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.ikindi!.replaceRange(2, 3, '')) &&
        currentHour <=
            int.parse(widget.prayerTimeModel.aksam!.replaceRange(2, 3, ''))) {
      return currentPrayerTime = widget.prayerTimeModel.ikindi!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.aksam!.replaceRange(2, 3, '')) &&
        currentHour <=
            int.parse(widget.prayerTimeModel.yatsi!.replaceRange(2, 3, ''))) {
      return currentPrayerTime = widget.prayerTimeModel.aksam!;
    }


/*


    else if (currentHour >=
        int.parse(widget.prayerTimeModel.yatsi!.replaceRange(2, 3, '')) &&
        currentHour <=
            int.parse(widget.prayerTimeModel.kible!.replaceRange(2, 3, ''))) {
      return currentPrayerTime = widget.prayerTimeModel.yatsi!;
*/



     else {
      return currentPrayerTime = widget.prayerTimeModel.yatsi!;
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    yenileme();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentPrayerTime = uptadeCurrentTime();
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    

    return
         Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: currentPrayerTime ==
                                  widget.prayerTimeModel.aksam ||
                              currentPrayerTime == widget.prayerTimeModel.yatsi
                          ? const AssetImage('assets/img_12.png')
                          : const AssetImage('assets/img_12.png'),
                      fit: BoxFit.cover)),
              child: Scaffold(
                bottomNavigationBar: Container(
                  height: MediaQuery.of(context).size.height / 24,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.black,  // Divider'ın rengini ayarlayabilirsiniz
                        height: 1,  // Divider'ın yüksekliğini ayarlayabilirsiniz
                        thickness: 0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 25,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("assets/pngegg.png"),
                                width: MediaQuery.of(context).size.width / 4.0,
                                height: MediaQuery.of(context).size.height / 0.1,
                              ),
                              AutoSizeText(
                                "Takvimi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                                minFontSize: 1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                appBar: AppBar(
                  toolbarHeight: MediaQuery.of(context).size.height / 30,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  title:
                  AutoSizeText(
                    "★★ ${widget.cityName} ★★"
                        .toUpperCase(),
                    // haftanın gününü alarak kullan
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    minFontSize:1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(35))),
                  centerTitle: true,
                ),
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Column(
                    children: [
                      Container(

                        height: MediaQuery.of(context).size.height / 2.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height / 100,
                                    ),
                                    Column(

                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                      SizedBox(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [

                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 200,
                                            ),
                                            /*

                                             */
                                            Stack(alignment: Alignment.bottomCenter,
                                              children: [

                                                Image(
                                                  image: AssetImage(
                                                      "assets/ayak.png"),
                                                  width: MediaQuery.of(context).size.width / 3.5,
                                                  height: MediaQuery.of(context).size.height / 13.5,
                                                ),
                                                Stack(

                                                alignment: Alignment.center,
                                                children:[

                                                  Container(
                                                    width: MediaQuery.of(context).size.width / 3.5,
                                                    height: MediaQuery.of(context).size.height / 13.5,
                                                    decoration:
                                                    BoxDecoration(
                                                      shape:
                                                      BoxShape.circle,
                                                      border: Border.all(
                                                          width: MediaQuery.of(context).size.width / 3.5,

                                                          color: Colors
                                                              .black),
                                                      // Add a border to create an empty frame
                                                      color: Colors
                                                          .white, // Set the color to transparent to make the container empty
                                                    ),
                                                  ),
                                                  Stack(
                                                    alignment: Alignment.topCenter,
                                                    children: [
                                                      Image(
                                                        image: AssetImage(
                                                            "assets/evs.png"),
                                                        width: 110,
                                                        height: 40
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 140,
                                                        child: Center(
                                                          child: Stack(
                                                            alignment:
                                                                Alignment.center,
                                                            children: [
                                                              AnalogClock(
                                                                dateTime:
                                                                DateTime.parse(
                                                                    '2020-01-02 ${widget.prayerTimeModel.gunes}:00'),
                                                                isKeepTime: false,
                                                                dialColor: Colors.white,
                                                                dialBorderColor: Colors.black,
                                                                dialBorderWidthFactor: 0.02,
                                                                markingColor: Colors.black,
                                                                markingRadiusFactor: 0.99,
                                                                markingWidthFactor: 1.0,
                                                                hourNumberColor: Colors.black,
                                                                hourNumbers: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                                                                hourNumberSizeFactor: 1.6,
                                                                hourNumberRadiusFactor: 0.9,
                                                                hourHandColor: Colors.black,
                                                                hourHandWidthFactor: 0.95,
                                                                hourHandLengthFactor: 0.6,
                                                                minuteHandColor: Colors.black,
                                                                minuteHandWidthFactor: 2.1,
                                                                minuteHandLengthFactor: 0.71,
                                                                secondHandColor: Colors.black,
                                                                secondHandWidthFactor: 0.0,
                                                                secondHandLengthFactor: 0.0,
                                                                centerPointColor: Colors.black,
                                                                centerPointWidthFactor: 1.0,
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(context).size.width / 1,
                                                                height: MediaQuery.of(context).size.height / 2,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape:
                                                                      BoxShape.circle,
                                                                  border: Border.all(
                                                                      width: 2,
                                                                      color: Colors
                                                                          .black),
                                                                  // Add a border to create an empty frame
                                                                  color: Colors
                                                                      .transparent, // Set the color to transparent to make the container empty
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                height: 88,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape:
                                                                      BoxShape.circle,
                                                                  border: Border.all(
                                                                      width: 2,
                                                                      color: Colors
                                                                          .black),
                                                                  // Add a border to create an empty frame
                                                                  color: Colors
                                                                      .transparent, // Set the color to transparent to make the container empty
                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ]),]
                                              ),]
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 100,

                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Section2(
                                            israk: widget.prayerTimeModel.israk!,
                                            israkVakti: 'İşrak     ',
                                            imsak: widget.prayerTimeModel.imsak!,
                                            imsakVakti: "İmsak    ",
                                            sabah: widget.prayerTimeModel.sabah!,
                                            sabahVakti: "Sabah   ",
                                            gunes: widget.prayerTimeModel.gunes!,
                                            gunesVakti: "Güneş   ",
                                            ogle: widget.prayerTimeModel.ogle!,
                                            ogleVakti: "Öğle      ",
                                            ikindi:
                                                widget.prayerTimeModel.ikindi!,
                                            ikindiVakti: "İkindi    ",
                                            aksam: widget.prayerTimeModel.aksam!,
                                            aksamVakti: "Akşam  ",
                                            yatsi: widget.prayerTimeModel.yatsi!,
                                            yatsiVakti: "Yatsı     ",
                                            /*
                                            kible: widget.prayerTimeModel.kible!,
                                            kibleVakti: "Kıble",

                                             */
                                            cityName: widget.cityName,
                                            currentPrayerTime: currentPrayerTime,
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ],
                                ),
                              ],
                            ),

                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: MediaQuery.of(context).size.height / 110,
                                ),

                                AutoSizeText(
                                  "${DateTime.now().day}",
                                  // ${DateTime.now().year}
                                  // bulunduğumuz yılı alarak kullan
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 65),
                                  minFontSize: 1,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),





















                                Center(
                                  child: AutoSizeText(
                                    "${getMonthName(DateTime.now().month)}"
                                        ,
                                    // bulunduğumuz yılı alarak kullan
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                    minFontSize: 1,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Center(
                                  child: AutoSizeText(
                                    "${DateTime.now().year}".toUpperCase(),
                                    // ${DateTime.now().year}
                                    // bulunduğumuz yılı alarak kullan
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                    minFontSize: 1,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),





                                SizedBox(
                                  height: MediaQuery.of(context).size.height / 100,
                                ),
                                Center(
                                  child: AutoSizeText(
                                    "${getWeekdayName(DateTime.now().weekday)}"
                                        .toUpperCase(),
                                    // haftanın gününü alarak kullan
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                    minFontSize: 1,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 75,
                            ),
                            Column(
                              //seke
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height / 100,
                                ),
                                Stack(alignment: Alignment.bottomCenter,
                                    children: [

                                      Image(
                                        image: AssetImage(
                                            "assets/ayak.png"),
                                        width: MediaQuery.of(context).size.width / 3.5,
                                        height: MediaQuery.of(context).size.height / 13.5,
                                      ),
                                      Stack(

                                          alignment: Alignment.center,
                                          children:[

                                            Container(
                                              width: MediaQuery.of(context).size.width / 3.5,
                                              height: MediaQuery.of(context).size.height / 13.5,
                                              decoration:
                                              BoxDecoration(
                                                shape:
                                                BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors
                                                        .black),
                                                // Add a border to create an empty frame
                                                color: Colors
                                                    .white, // Set the color to transparent to make the container empty
                                              ),
                                            ),
                                            Stack(
                                                alignment: Alignment.topCenter,
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                        "assets/evs.png"),
                                                      width: 110,
                                                      height: 40
                                                  ),

                                                  
                                                  Container(
                                                    width: 100,
                                                    height: 140,
                                                    child: Center(
                                                      child: Stack(
                                                        alignment:
                                                        Alignment.center,
                                                        children: [
                                                          AnalogClock(
                                                            dateTime:
                                                            DateTime.now(),
                                                            isKeepTime: true,
                                                            dialColor: Colors.white,
                                                            dialBorderColor: Colors.black,
                                                            dialBorderWidthFactor: 0.02,
                                                            markingColor: Colors.black,
                                                            markingRadiusFactor: 0.99,
                                                            markingWidthFactor: 1.0,
                                                            hourNumberColor: Colors.black,
                                                            hourNumbers: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                                                            hourNumberSizeFactor: 1.6,
                                                            hourNumberRadiusFactor: 0.9,
                                                            hourHandColor: Colors.black,
                                                            hourHandWidthFactor: 0.95,
                                                            hourHandLengthFactor: 0.6,
                                                            minuteHandColor: Colors.black,
                                                            minuteHandWidthFactor: 2.1,
                                                            minuteHandLengthFactor: 0.71,
                                                            secondHandColor: Colors.red,
                                                            secondHandWidthFactor: 2,
                                                            secondHandLengthFactor: 0.8,
                                                            centerPointColor: Colors.black,
                                                            centerPointWidthFactor: 1.0,
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(context).size.width / 1,
                                                            height: MediaQuery.of(context).size.height / 2,
                                                            decoration:
                                                            BoxDecoration(
                                                              shape:
                                                              BoxShape.circle,
                                                              border: Border.all(
                                                                  width: 2,
                                                                  color: Colors
                                                                      .black),
                                                              // Add a border to create an empty frame
                                                              color: Colors
                                                                  .transparent, // Set the color to transparent to make the container empty
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 100,
                                                            height: 88,
                                                            decoration:
                                                            BoxDecoration(
                                                              shape:
                                                              BoxShape.circle,
                                                              border: Border.all(
                                                                  width: 2,
                                                                  color: Colors
                                                                      .black),
                                                              // Add a border to create an empty frame
                                                              color: Colors
                                                                  .transparent, // Set the color to transparent to make the container empty
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ]),]
                                      ),]
                                ),
                                
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width / 3.5,
                                      height: MediaQuery.of(context).size.height / 13,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.black,
                                          width: 01.5,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                        AutoSizeText("Hicri \n${widget.arkayuzModel.hicriTarih}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                          minFontSize: 1,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                          ],
                                        ),
                                      ),
                                    ),







                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 300,
                                    ),




                                    Container(
                                      width: MediaQuery.of(context).size.width / 3.5,
                                      height: MediaQuery.of(context).size.height / 20,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.black,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            AutoSizeText("${widget.arkayuzModel.hizirKasim}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                              minFontSize: 1,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),


                                          ],
                                        ),
                                      ),
                                    ),





                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 300,
                                    ),








                                    Container(
                                      width: MediaQuery.of(context).size.width / 3.5,
                                      height: MediaQuery.of(context).size.height / 20,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.black,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            AutoSizeText("Kıble sa. ${widget.prayerTimeModel.kible}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                              minFontSize: 1,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),


                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 300,
                                    ),


                                    Container(
                                      width: MediaQuery.of(context).size.width / 3.5,
                                      height: MediaQuery.of(context).size.height / 10.3,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.black,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: AutoSizeText("Yerel saat\n${DateFormat('HH:mm:ss').format(DateTime.now())}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                            minFontSize: 1,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 75,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      Center(
                          child:
                          AutoSizeText("${widget.arkayuzModel.gunDurumu}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                            minFontSize: 1,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),






                          ),
                      Center(
                          child:
                          AutoSizeText("${widget.arkayuzModel.ezaniDurum}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                            minFontSize: 1,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),


                        
                          ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 200,
                      ),


                      Container(
                        width: MediaQuery.of(context).size.width /1.15,
                        
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(0.0), // Adjust the padding value as per your requirement
                          child:

                          Html(
                            data: """
    
  <span style="font-size: 18 px;">
    ${widget.arkayuzModel.gununSozu.toString()}
  </span>


  """,
                          )




                        ),
                        ),


                      SizedBox(
                        height: MediaQuery.of(context).size.height / 200,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 5),
                          Section1(
                            nextPrayerTime: findTargetPrayerTime(),
                            vakit: nextPrayerTime,
                          ),

                        ],
                      ),
                      
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>

                                    InteractiveViewer(
                                        panEnabled: false, // Set it to false to prevent panning.
                                        boundaryMargin: EdgeInsets.all(80),
                                        minScale: 0.5,
                                        maxScale: 4,
                                        child: TakvimSayfasi(yaprak: widget.arkayuzModel),





                              )));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            AutoSizeText("Arka sayfa   ⫸",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.deepOrange[500],
                                  fontWeight: FontWeight.normal,
                                  fontSize: 26),
                              minFontSize: 1,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),


                          ],
                        ),
                      ),
                     
                      
                    ],

                  ),
                ),
              ),
             );



}}
