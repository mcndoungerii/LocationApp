import 'package:flutter/material.dart';
import 'package:location_app/models/place.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';

import './map_screen.dart';

class PlaceDetailScreen extends StatefulWidget {
  static const routeName = './place-detail';
  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlace>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            selectedPlace.location.address,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            child: Text('View on Map'),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MapScreen(
                    initialLocation: PlaceLocation(
                      latitude: selectedPlace.location.latitude,
                      longitude: selectedPlace.location.longitude,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
