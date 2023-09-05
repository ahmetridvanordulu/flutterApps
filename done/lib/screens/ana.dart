import 'package:done/models/items_data.dart';
import 'package:flutter/material.dart';
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
              child: Text("5 Items",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 50, right: 50, bottom: 20),
                  child: ListView.builder(
                      itemBuilder: (context, index) => ItemCard(
                          baslik: Listem().itemler[index].baslik,
                          yapildimi: Listem().itemler[index].yapildimi),
                      itemCount: 4),
                ),
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
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
