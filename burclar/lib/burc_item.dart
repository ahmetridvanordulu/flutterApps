import 'package:burclar/burc_detay.dart';
import 'package:burclar/model/burc_model.dart';

import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  BurcItem({required this.burcListem, super.key});

  final burcModeli burcListem;

  @override
  Widget build(BuildContext context) {
    var textStayle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/burcDetay",arguments: burcListem);
            },
            leading: Image.asset(
              "images/" + burcListem.burcKucukResim,
              width: MediaQuery.of(context).size.width / 6,
              height: MediaQuery.of(context).size.height / 6,
            ),
            title: Text(burcListem.burcAdi,style: textStayle.titleLarge),
            subtitle: Text(burcListem.burcTarihi,style: textStayle.titleSmall),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
