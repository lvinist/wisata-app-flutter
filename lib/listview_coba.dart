import 'package:flutter/material.dart';

class ScrollingScreen extends StatelessWidget {
  final List<int> numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: numberList.map((number) {
          return Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.green, border: Border.all(color: Colors.black)),
              child: Center(
                child: Text(
                  '$number',
                  style: TextStyle(fontSize: 50),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
