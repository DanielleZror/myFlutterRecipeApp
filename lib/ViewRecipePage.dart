import 'package:flutter/material.dart';
import './data.dart';

class ViewRecipePage extends StatelessWidget {
  var data = Data.getData;
  final recipe;
  ViewRecipePage({Key key, @required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 27),
        child: AppBar(
          automaticallyImplyLeading: false, // Don't show the leading button
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
              Text(recipe['name']),
            ],
          ),
          backgroundColor: Colors.grey[700],
        ),
      ),
      body: Text(recipe['name'].toString()),
    );
  }
}
