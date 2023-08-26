import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    alan(int ver){

      return MediaQuery.of(context).size.height / ver;
    }
    
    return Scaffold(
      
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      appBar: AppBar(title: Text("Get It Done")),
      body: Column(
        children: [
          SizedBox(
            height: alan(23),
          ),
          Expanded(
            flex: 1,
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "5 İtems",style: Theme.of(context).textTheme.headlineLarge
                  ),
                ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: alan(2000)
                ,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100))
                ),
              ),
            ),
          ) 
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

      },
      child: Icon(Icons.add_task),
      ),
    );
  }
}
