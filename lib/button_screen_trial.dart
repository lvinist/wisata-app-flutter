import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text('Tombol Raised'),
          ),
          TextButton(onPressed: () {}, child: Text('Text Button')),
          OutlinedButton(
            onPressed: () {},
            child: Text('Outline Button'),
          ),
          IconButton(
              icon: Icon(Icons.volume_up),
              tooltip: 'Increase Volume by 10',
              onPressed: () {}),
        ],
      )),
    );
  }
}
