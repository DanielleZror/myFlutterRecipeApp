import 'package:flutter/material.dart';
import './CardRow.dart';
import './data.dart';

class AllRecipesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllRecipesPageState();
  }
}

class AllRecipesPageState extends State<AllRecipesPage> {
  var data = Data.getData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return CardRow(data[index], index);
        },
      ),
    );
  }
}
