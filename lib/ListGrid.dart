import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListGrid extends StatefulWidget {
  final data;
  ListGrid(this.data);
  @override
  _ListGridState createState() => _ListGridState(data);
}

class _ListGridState extends State<ListGrid> {
  final data;
  _ListGridState(this.data);
  var _isFavorited = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

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
                    height: 160,
                    width: double.maxFinite,
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
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
                                  recipeDetails(data[index], index),
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
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.left,
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget recipeDescription(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.left,
        text: TextSpan(
          text: '${data['description']}',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget recipeDetails(data, index) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.perm_identity, color: Colors.pink),
                    Text('${data['athor']}'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      iconSize: 25,
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      icon: (_isFavorited[index]
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border)),
                      color: Colors.pink,
                      onPressed: () => _toggleFavorite(index),
                    ),
                    (int.parse(data['likes']) < 500)
                        ? Text('${data['likes']}')
                        : Text('500+'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
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
                            : Text('${data['hours']}' +
                                ':' +
                                '${data['minutes']}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleFavorite(index) {
    setState(() {
      if (_isFavorited[index]) {
        _isFavorited[index] = false;
        //TODO change number in DB
      } else {
        _isFavorited[index] = true;
      }
    });
  }
}
