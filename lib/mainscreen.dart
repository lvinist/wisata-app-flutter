import 'package:flutter/material.dart';
import 'package:wisata_app/detail_screen.dart';
import 'package:wisata_app/model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wisata di Bandung'),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 700) {
              return TourismListView();
            } else if (constraints.maxWidth <= 900) {
              return TourismGridView(gridCount: 4);
            } else if (constraints.maxWidth <= 1200) {
              return TourismGridView(gridCount: 5);
            } else {
              return TourismGridView(gridCount: 6);
            }
          },
        ));
  }
}

class TourismListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Hero(
                        tag: place.imageAsset,
                        child: Image.asset(place.imageAsset),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              place.name,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              place.location,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}

class TourismGridView extends StatelessWidget {
  final int gridCount;

  TourismGridView({required this.gridCount});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: tourismPlaceList.map((place) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(place: place);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Hero(
                      tag: place.imageAsset,
                      child: Image.asset(
                        place.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    )),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        place.name,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 8),
                      child: Text(
                        place.location,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
