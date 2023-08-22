import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/model/hava_durumu_model.dart';

class client {

  Future<havaDurumuSinifi>? API(String sehir) async {
    var linkiCevirme = await Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$sehir&appid=1c19c4335be3550514a62381072d0ca7&units&metric");

    var hazirLink = await http.get(linkiCevirme);
    var decode = await jsonDecode(hazirLink.body);
    print(havaDurumuSinifi.fromjson(decode).sehirAdi);
    var nem = havaDurumuSinifi.fromjson(decode).nem;

    print(nem);
    return havaDurumuSinifi.fromjson(decode);
  }
}
