import 'package:flutter/material.dart';
import './CardRow.dart';
import './data.dart';

class AllRecipesPage extends StatelessWidget {
  var data = Data.getData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: <Widget>[
          CardRow(data[0], 0),
          CardRow(data[1], 1),
        ],
      ),
    );
  }
}
