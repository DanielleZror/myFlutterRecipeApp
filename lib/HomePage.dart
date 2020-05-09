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
            preferredSize: Size(40, 27),
            child: Container(
              color: Colors.grey[700],
              //   child: SafeArea(
              child: Column(
                children: <Widget>[
                  TabBar(
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(
                          Icons.photo_library,
                          color: Colors.pink,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.list,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //   ),
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
