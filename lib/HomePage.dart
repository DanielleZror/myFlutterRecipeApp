import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './PhotoGrid.dart';
import './ListGrid.dart';
import './data.dart';

class HomePage extends StatelessWidget {
  var data = Data.getData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(0, 27),
            child: Container(
              color: Colors.grey[700],
              child: Column(
                children: <Widget>[
                  TabBar(
                    indicatorColor: Colors.pink,
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(
                          Icons.photo_library,
                          color: Colors.white,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.list,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              PhotoGrid(data),
              ListGrid(data),
            ],
          ),
        ),
      ),
    );
  }
}
