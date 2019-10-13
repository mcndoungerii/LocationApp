import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future:
            Provider.of<GreatPlace>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapShot) =>
            snapShot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlace>(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text('Got no places now.. add some'),
                        ),
                        SizedBox(height: 10),
                        FlatButton.icon(
                          icon: Icon(Icons.add),
                          label: Text('Click here, to add Place'),
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AddPlaceScreen.routeName);
                          },
                        ),
                      ],
                    ),
                    builder: (context, greatPlace, ch) =>
                        greatPlace.items.length <= 0
                            ? ch
                            : ListView.builder(
                                itemCount: greatPlace.items.length,
                                itemBuilder: (ctx, i) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(greatPlace.items[i].image),
                                  ),
                                  title: Text(greatPlace.items[i].title),
                                  onTap: () {
                                    //go to detail page
                                  },
                                ),
                              ),
                  ),
      ),
    );
  }
}
