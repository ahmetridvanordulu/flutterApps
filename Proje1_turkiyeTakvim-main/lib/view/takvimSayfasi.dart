import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:turkiyetakvimi/constant.dart';
import 'package:turkiyetakvimi/model/yaprakModel.dart';
import 'package:turkiyetakvimi/view/home_screen.dart';
import 'package:turkiyetakvimi/view/loading_screen.dart';

class TakvimSayfasi extends StatefulWidget {
   TakvimSayfasi({Key? key,  required this.yaprak}) : super(key: key);
  final Yaprak yaprak;

  @override
  State<TakvimSayfasi> createState() => _TakvimSayfasiState();
}

class _TakvimSayfasiState extends State<TakvimSayfasi> {
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
        return "Ocak";
      case 2:
        return "Şubat";
      case 3:
        return "Mart";
      case 4:
        return "Nisan";
      case 5:
        return "Mayıs";
      case 6:
        return "Haziran";
      case 7:
        return "Temmuz";
      case 8:
        return "Ağustos";
      case 9:
        return "Eylül";
      case 10:
        return "Ekim";
      case 11:
        return "Kasım";
      case 12:
        return "Aralık";
      default:
        return "";
    }
  }


  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/img_12.png'))),
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
          title: AutoSizeText(
            "★★ ${DateTime.now().day} "
                "${getMonthName(DateTime.now().month)} ${DateTime.now().year} ★★",
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Container(
                width: MediaQuery.of(context).size.width /1.1,
                height: MediaQuery.of(context).size.height /1.50,
                child: SingleChildScrollView(
                    child:


                    Html(
                      data: """
    <span style="font-size: 19.2px;">
     ${widget.yaprak.arkayuz!.baslik}+${widget.yaprak.arkayuz!.yazi}
    </span>
  """,
                    )





                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 200,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 0,
                height: MediaQuery.of(context).size.height / 300,
                decoration: BoxDecoration(
                  color: Colors.black,
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

                    ],
                  ),
                ),
              ),

          SizedBox(
            height: MediaQuery.of(context).size.height / 200,
          ),


              Container(
                width: MediaQuery.of(context).size.width /1.1,
                height: MediaQuery.of(context).size.height /11,
                child:
                SingleChildScrollView(
                    child:


                    Html(
                      data: """
    <span style="font-size: 19.2px;">
     ${widget.yaprak.isimYemek}
    </span>
  """,
                    )
                ),









              ),

              TextButton(onPressed: () {
              Navigator.pop(context);
              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText("⫷   Ön sayfa",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.deepOrange[500],
                        fontWeight: FontWeight.normal,
                        fontSize: 26),
                    minFontSize: 1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),



                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),

                ],
              ),)


            ],
          ),
        ),
      ),
    );




  }
}












/*



 */