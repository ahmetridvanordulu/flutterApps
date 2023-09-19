import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: bas(),
    );
  }
}

class bas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("merhaba"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TaskItem(
            Tasks: "1. Örnek",
          ),
          TaskItem(
            Tasks: "2. Örnek",
          ),
          TaskItem(Tasks: "3. Örnek")
        ],
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  String Tasks = "";
  bool? dokunuldumu = false;

  TaskItem({super.key, required this.Tasks});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: dokunuldumu,
          onChanged: (value) => dokunuldumu = value, // 4:44
        ),
        Text(Tasks),
      ],
    );
  }
}
