import 'package:flutter/material.dart';
import 'package:wisata_app_web/model/tempat_wisata.dart';

class DetailScreen extends StatelessWidget {
  late final TempatWisata place;
  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWeb(placedetailweb: place);
        } else {
          return DetailMobile(placeDetailMobile: place);
        }
      },
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class DetailWeb extends StatelessWidget {
  late final TempatWisata placedetailweb;
  DetailWeb({required this.placedetailweb});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Wisata',
          style: TextStyle(
              fontSize: 32,
              fontFamily: 'Staatliches',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        SizedBox(
          height: 32,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(placedetailweb.imageAsset),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 150,
                    padding: EdgeInsets.only(bottom: 16),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: placedetailweb.imageUrls.map((jadiimageurl) {
                        return Padding(
                          padding: EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(jadiimageurl),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Expanded(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          placedetailweb.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Oxygen',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          SizedBox(height: 8),
                          Text(
                            placedetailweb.openDays,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.timer),
                          SizedBox(height: 8),
                          Text(
                            placedetailweb.openTimes,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.monetization_on),
                          SizedBox(height: 8),
                          Text(
                            placedetailweb.ticketPriece,
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          placedetailweb.desc,
                          style: TextStyle(fontSize: 16, fontFamily: 'Oxygen'),
                        ),
                      ),
                      FavoriteButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class DetailMobile extends StatelessWidget {
  late final TempatWisata placeDetailMobile;
  DetailMobile({required this.placeDetailMobile});
  var fontOxygen = TextStyle(fontFamily: 'Oxygen', fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(placeDetailMobile.imageAsset, scale: 0.10),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                                icon:
                                    Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                          FavoriteButton()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text(
                  placeDetailMobile.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Staatliches'),
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
                        Text(
                          placeDetailMobile.openDays,
                          style: fontOxygen,
                        ),
                        SizedBox(height: 8)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.timer),
                        Text(placeDetailMobile.openTimes, style: fontOxygen),
                        SizedBox(height: 8)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        Text(placeDetailMobile.ticketPriece, style: fontOxygen),
                        SizedBox(height: 8)
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  placeDetailMobile.desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: placeDetailMobile.imageUrls.map((url) {
                      return Padding(
                        padding: EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(url),
                        ),
                      );
                    }).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
