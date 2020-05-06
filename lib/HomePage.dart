import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './data.dart';

class HomePage extends StatelessWidget {
  var data = Data.getData;
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 4,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => Container(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: AssetImage(data[index]['image']),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  width: 200,
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
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(
                        data[index]['description'],
                        style: TextStyle(color: Colors.grey[800], fontSize: 18),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 3 : 2),
        mainAxisSpacing: 24,
        crossAxisSpacing: 12,
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
