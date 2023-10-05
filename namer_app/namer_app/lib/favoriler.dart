import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites1.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("You have ${appState.favorites1.length} favorites "),
        ),
        for (var pair in appState.favorites1)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
