import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './data.dart';

class FavoriteRecipesPage extends StatelessWidget {
  var data = Data.getData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[800],
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    height: 150,
                    width: double.maxFinite,
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(8.0),
                          border: Border(
                            top: BorderSide(width: 2.0, color: Colors.pink),
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: recipeImage(data[index]),
                            ),
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  recipeName(data[index]),
                                  recipeDescription(data[index]),
                                  recipeDetails(data[index]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recipeImage(data) {
    return Image(
      image: AssetImage(data['image']),
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    );
  }

  Widget recipeName(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: RichText(
        textAlign: TextAlign.end,
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget recipeDescription(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: '${data['description']}',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget recipeDetails(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.perm_identity, color: Colors.pink),
                  Text('${data['athor']}'),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.favorite_border, color: Colors.pink),
                  (int.parse(data['likes']) < 500)
                      ? Text('${data['likes']}')
                      : Text('500+'),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.access_time, color: Colors.pink),
                  (int.parse(data['hours']) > 0 &&
                          int.parse(data['minutes']) == 0)
                      ? Text('${data['hours']}' + 'h')
                      : (int.parse(data['hours']) == 0 &&
                              int.parse(data['minutes']) > 0)
                          ? Text('${data['minutes']}' + 'm')
                          : Text(
                              '${data['hours']}' + ':' + '${data['minutes']}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
