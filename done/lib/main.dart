import 'package:flutter/material.dart';
// 50 Dakika kaldı.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String sehir = "Van";

  void degistir(String yeniSehir){
      sehir = yeniSehir;
      setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('callback kullanımı'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: SolWidgetA()),
            Expanded(child: SagWidgetA(sehir: sehir,callBack: degistir,))
          ],
        ),
      ),
    );
  }
}

class SolWidgetA extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Text(
              'Sol Widget',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Sehir: ..... ',
              style: TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}

class SagWidgetA extends StatelessWidget {

  String? sehir;
  Function? callBack;

  SagWidgetA({Key? key,required this.sehir,required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(children: [
        Text(
          'SagWidget A $sehir',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetB(sehir: sehir,geriArama: callBack,)
      ]),
    );
  }
}

class SagWidgetB extends StatelessWidget {

  String? sehir;
  Function? geriArama;

  SagWidgetB({Key? key,required this.sehir,required this.geriArama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 180,
      color: Colors.purple,
      child: Column(children: [
        Text(
          'SagWidget B $sehir',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetC(metin: sehir,gelenFonksiyon: geriArama,)
      ]),
    );
  }
}

class SagWidgetC extends StatelessWidget {
  String? metin;
  Function? gelenFonksiyon;


  SagWidgetC({Key? key,required this.metin,required this.gelenFonksiyon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150,
      width: 160,
      child: Column(children: [
        Text(
          'SagWidget C $metin',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Şehir: ...$metin',
          style: TextStyle(fontSize: 20),
        ),
        TextField(onChanged:
        (girilen) {
          gelenFonksiyon!(girilen);
        },
        )
      ]),
    );
  }
}