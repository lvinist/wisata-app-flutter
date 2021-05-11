import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
          Icons.menu,
          color: Colors.white,
        )),
        title: Text('Image Screen'),
      ),
      body: Center(
          child: Image.asset(
        'image/test.png',
        width: 200,
        height: 200,
      )),
    );
  }
}
