import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './ListGrid.dart';
import './data.dart';

class FavoriteRecipesPage extends StatelessWidget {
  var data = Data.getData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListGrid(data));
  }
}
