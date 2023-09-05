import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'item.dart';

class Listem with ChangeNotifier{

  final List<Item> itemler = [
    Item(baslik: "Ürünü al"),
    Item(baslik: "Vergini öde"),
    Item(baslik: "Ödevini yap"),

  ];
}
