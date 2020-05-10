import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myrecipesflutterapp/Models/recipe.dart';
import './Widgets/Card/PhotoGridCard.dart';

class PhotoGrid extends StatefulWidget {
  final data;
  PhotoGrid(this.data);
  @override
  _PhotoGridState createState() => _PhotoGridState(data);
}

class _PhotoGridState extends State<PhotoGrid> {
  final data;
  _PhotoGridState(this.data);
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
      backgroundColor: Colors.grey[800],
      body: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 4,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => PhotoCard(
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
        ),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
      ),
    );
  }

  void _toggleFavorite(index) {
    setState(() {
      if (_isFavorited[index]) {
        _isFavorited[index] = false;
        //TODO change number in DB
        //TODO change index to id
      } else {
        _isFavorited[index] = true;
      }
    });
  }
}
