import 'package:flutter/material.dart';
import 'package:wisata_app/detail_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wisata di Bandung'),
        ),
        body: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen();
            }));
          },
          child: Card(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset('images/bosscha.jpg'),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Wisata Bosscha',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Lembang',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
