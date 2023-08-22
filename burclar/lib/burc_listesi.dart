import 'package:burclar/burc_item.dart';
import 'package:burclar/data/strings.dart';
import 'package:burclar/model/burc_model.dart';

import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  List<burcModeli>? tumburclar;

  BurcListesi() {
    tumburclar = veriCek();
    print(tumburclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Burçlar Listesi"), centerTitle: true),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return BurcItem(burcListem: tumburclar![index]);
        },
        itemCount: tumburclar!.length,
      )),
    );
  }

  List<burcModeli>? veriCek() {
    List<burcModeli>? gecici = [];

    for (int xes = 0; xes < 12; xes++) {
      var burcadi = Strings.BURC_ADLARI[xes];
      var burcTarihi = Strings.BURC_TARIHLERI[xes];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[xes];
      var burcKucukResim =
          Strings.BURC_ADLARI[xes].toLowerCase() + "${xes + 1}" + ".png";
      var BuyukResim =
          Strings.BURC_ADLARI[xes].toLowerCase() + "_buyuk${xes + 1}.png";

      burcModeli b1 = burcModeli(
          burcadi, burcTarihi, burcDetay, burcKucukResim, BuyukResim);
      gecici.add(b1);
    }
    return gecici;
  }
}
