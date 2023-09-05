import 'package:done/models/items_data.dart';
import 'package:done/models/items_data.dart';
import 'package:done/models/items_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/items_data.dart';
import '../widgets/item_card.dart';

class ana2 extends StatelessWidget {
  const ana2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Yap şu işi",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(30),
              child: Text("${Provider.of<Listem>(context).itemler.length} Items",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 50, right: 50, bottom: 20),
                  child: ListView.builder(

                      itemBuilder: (context, index) => ItemCard(
                          baslik: Provider.of<Listem>(context).itemler[index].baslik,
                          yapildimi: Provider.of<Listem>(context).itemler[index].yapildimi),
                      itemCount: Provider.of<Listem>(context).itemler.length),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.plus_one_sharp,
        ), // 11:23
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
