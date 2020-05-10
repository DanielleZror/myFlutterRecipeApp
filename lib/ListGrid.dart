import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myrecipesflutterapp/Models/recipe.dart';
import './Widgets/Card/ListCard.dart';

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
                padding: EdgeInsets.all(0),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListCard(
                    Recipe(
                      data[index]['name'],
                      data[index]['description'],
                      data[index]['author'],
                      int.parse(data[index]['hours']),
                      int.parse(data[index]['minutes']),
                      data[index]['image'],
                      int.parse(data[index]['likes']),
                      _isFavorited[index],
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
}
