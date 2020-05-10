import 'package:flutter/material.dart';
import '../../Models/recipe.dart';

abstract class BasicCard extends StatefulWidget {
  final Recipe recipe;
  BasicCard(this.recipe);

  @override
  State createState(); // => _BasicCardState();
}

//class _BasicCardState extends State<BasicCard> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}
