import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Widget? detayliBilgi(String ruzgar,String nem,String basinc,String hissedilen,BuildContext context){
  TextStyle fontlar = TextStyle(fontSize: 22,fontWeight: FontWeight.w900);
  TextStyle fontlar2 = TextStyle(fontSize: 22,fontWeight: FontWeight.w600);

  return Container(
    padding: EdgeInsets.all(16),
    width: double.infinity,
    color: Colors.yellowAccent,
    child:  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Rüzgar",style: fontlar),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Text("Basınç",style: fontlar),
              ],
            ),
            Column(
              children: [
                Text("$ruzgar",style: fontlar),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Text("$basinc",style: fontlar),
              ],
            ),
            Column(
              children: [
                Text("Nem",style: fontlar2),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Text("Hissettirdiği",style: fontlar2),
              ],
            ),
            Column(
              children: [
                Text("$nem",style: fontlar2),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Text("$hissedilen",style: fontlar2),
              ],
            )
          ],
        )
      ],
    )
  );
}