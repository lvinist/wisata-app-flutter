import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? language;
  String _name = '';
  bool lightOn = false;
  var agree = false;

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
                onChanged: (String? value) {
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
                  onChanged: (String? value) {
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
                  onChanged: (String? value) {
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
                  onChanged: (value) {
                    setState(() {
                      agree = !agree;
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
