import 'package:burclar/model/burc_model.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final burcModeli secilenBurc;

  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color? appBarRenk = Colors.transparent;
  PaletteGenerator? _generator;

  @override
  void initState() {
    super.initState();
    futuremetodu();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle:  true,
          expandedHeight: 250,
          pinned: true,
          backgroundColor: appBarRenk,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.secilenBurc.burcAdi + " Burcu ve özellikleri"),
            background: Image.asset(
              "images/" + widget.secilenBurc.burcBuyukResim,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenBurc.burcDetay,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
      ],
      physics:
          BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
    ));
  }

  Future? futuremetodu() async{
    _generator = await PaletteGenerator.fromImageProvider(AssetImage("images/"+widget.secilenBurc.burcBuyukResim));
    appBarRenk = _generator!.vibrantColor!.color;
    setState(() {

    });
    print(appBarRenk);
  }
}
/*
Column(
        children: [
          Text(
            secilenBurc.burcAdi,
          ),
          Text(
            secilenBurc.burcDetay,
          ),
          Text(secilenBurc.burcTarihi),
        ],
      ),
 */
