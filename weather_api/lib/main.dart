import 'package:flutter/material.dart';
import 'package:weather_api/custom/current_weather.dart';
import 'package:weather_api/detayliBilgi/detayliBilgi.dart';
import 'package:weather_api/model/hava_durumu_model.dart';
import 'package:weather_api/services/api_call.dart';

void main() {
  runApp(const baslat());
}

class baslat extends StatelessWidget {
  const baslat({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: g1(),
    );
  }
}

class g1 extends StatefulWidget {
  const g1({super.key});

  @override
  State<g1> createState() => _g1State();
}

class _g1State extends State<g1> {
  client c1 = client(); //Apı sınıfı
  havaDurumuSinifi? h1; //veriler

  Future<void> veriyiGetir() async {
    h1 = await c1.API("boston");
  }

  //40 44

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          elevation: 12,
          title:
              const Text("Hava sıcaklığı Api", style: TextStyle(fontSize: 25)),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_tree_outlined),
              color: Colors.greenAccent),
        ),
        body: FutureBuilder(
          future: veriyiGetir(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  suankiSicaklik(Icons.snowboarding, "${h1!.sicaklik}",
                      "${h1!.sehirAdi}", context)!,
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  detayliBilgi("${h1!.ruzgar}", "${h1!.nem}", "${h1!.basinc}",
                      "${h1!.hissedilen}", context)!,
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
            return Container();
          },
        ));
  }
}

/*

 */
