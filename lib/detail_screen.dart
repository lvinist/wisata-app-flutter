import 'package:flutter/material.dart';
import 'package:wisata_app/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 800) {
            return MobileDetailScreen(place: place);
          } else {
            return WebDetailScreen(place: place);
          }
        },
      ),
    );
  }
}

class MobileDetailScreen extends StatelessWidget {
  final informationTextStyle = TextStyle(fontFamily: 'Oxygen');
  final TourismPlace place;

  MobileDetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                Hero(
                    tag: place.imageAsset,
                    child: Image.asset(place.imageAsset)),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        FavoriteButton()
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8),
                        Text(
                          place.openDays,
                          style: informationTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(height: 8),
                        Text(
                          place.openTime,
                          style: informationTextStyle,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.money),
                        SizedBox(height: 8),
                        Text(
                          place.ticketPrice,
                          style: informationTextStyle,
                        ),
                      ],
                    )
                  ],
                )),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((url) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList()),
            )
          ],
        ),
      )),
    );
  }
}

class WebDetailScreen extends StatelessWidget {
  final informationTextStyle = TextStyle(fontFamily: 'Oxygen');
  final TourismPlace place;

  WebDetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lokasi Wisata',
            style: TextStyle(fontSize: 36),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                children: [
                  Hero(
                      tag: place.imageAsset,
                      child: ClipRRect(
                        child: Image.asset(place.imageAsset),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: place.imageUrls.map((url) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(url),
                            ),
                          );
                        }).toList()),
                  )
                ],
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: Text(
                              place.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Icon(Icons.calendar_today),
                                      SizedBox(height: 8),
                                      Text(
                                        place.openDays,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Icon(Icons.access_time),
                                      SizedBox(height: 8),
                                      Text(
                                        place.openTime,
                                        style: informationTextStyle,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Icon(Icons.money),
                                      SizedBox(height: 8),
                                      Text(
                                        place.ticketPrice,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  )
                                ],
                              )),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              place.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FavoriteButton(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
            ],
          )
        ],
      ),
    ));
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        });
  }
}
