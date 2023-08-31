import 'package:flutter/material.dart';

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
        children: [Container(), Container()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
          child: Icon(Icons.plus_one_sharp,), // 11:23
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
