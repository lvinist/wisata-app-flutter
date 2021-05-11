import 'dart:ui';
import 'package:wisata_app/detail_screen.dart';
import 'package:wisata_app/listview_coba.dart';
import 'package:wisata_app/first_second_screen_nav.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Wisata',
      theme: ThemeData(
        fontFamily: 'Oswald',
      ),
      home: FirstScreenOut(),
    );
  }
}

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

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String language;
  String _name = '';
  bool lightOn = false;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              DropdownButton<String>(
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(value: 'Dart', child: Text('Dart')),
                  DropdownMenuItem<String>(
                      value: 'Flutter', child: Text('Flutter')),
                  DropdownMenuItem<String>(value: 'Swift', child: Text('Swift'))
                ],
                value: language,
                hint: Text('Select Language'),
                onChanged: (String value) {
                  setState(() {
                    language = value;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Write your name here', labelText: 'Your name'),
                  onChanged: (String value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: Text('Hello, $_name, user of $language'));
                      });
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Submit'),
                ),
              ),
              Switch(
                  value: lightOn,
                  onChanged: (bool value) {
                    setState(() {
                      lightOn = value;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(lightOn ? 'light is on' : 'light is off'),
                      duration: Duration(seconds: 3),
                    ));
                  }),
              ListTile(
                leading: Radio<String>(
                  value: 'Dart',
                  groupValue: language,
                  onChanged: (String value) {
                    setState(() {
                      language = value;
                      showSnackBar();
                    });
                  },
                ),
                title: Text('Dart'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Flutter',
                  groupValue: language,
                  onChanged: (String value) {
                    setState(() {
                      language = value;
                      showSnackBar();
                    });
                  },
                ),
                title: Text('Flutter'),
              ),
              ListTile(
                leading: Checkbox(
                  value: agree,
                  onChanged: (bool value) {
                    setState(() {
                      agree = value;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(agree ? 'you are agreeing' : 'please agree'),
                        duration: Duration(seconds: 3),
                      ));
                    });
                  },
                ),
                title: Text('Agree / Disagree'),
              )
            ],
          ),
        ));
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$language is selected'),
      duration: Duration(seconds: 3),
    ));
  }
}

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
