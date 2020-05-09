import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotoGrid extends StatelessWidget {
  final data;
  PhotoGrid(this.data);

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
                          Text(
                            data[index]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.pink.withOpacity(0.8),
                            size: 26,
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(
                        data[index]['description'],
                        style: TextStyle(color: Colors.grey[800], fontSize: 18),
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
}
