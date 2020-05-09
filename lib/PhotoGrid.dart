import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        itemBuilder: (BuildContext context, int index) => Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              ClipRRect(
                child: Image(
                  image: AssetImage(data[index]['image']),
                  fit: BoxFit.cover,
                ),
              ),
              Divider(
                color: Colors.pink,
                thickness: 2,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 135,
                            child: Text(
                              data[index]['name'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ),
                          IconButton(
                            iconSize: 25,
                            padding: const EdgeInsets.all(0.0),
                            icon: (_isFavorited[index]
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border)),
                            color: Colors.pink,
                            onPressed: () => _toggleFavorite(index),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(
                        data[index]['description'],
                        style: TextStyle(color: Colors.grey[800], fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(height: 10),
                    ],
                  ))
            ],
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
      } else {
        _isFavorited[index] = true;
      }
    });
  }
}
