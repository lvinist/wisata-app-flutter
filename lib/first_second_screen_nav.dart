import 'package:flutter/material.dart';

class FirstScreenOut extends StatelessWidget {
  final String message = "halo disana screen 2";

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('first screen'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Lets go',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondScreen(message)));
            },
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  final String message;

  SecondScreen(this.message);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Screen'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            SizedBox(height: 20),
            OutlinedButton(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 20),
                  )),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )));
  }
}
