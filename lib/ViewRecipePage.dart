import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './data.dart';

class ViewRecipePage extends StatelessWidget {
  var data = Data.getData;
  final recipe;
  ViewRecipePage({Key key, @required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
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
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(5),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Image(
                  image: AssetImage(recipe['image']),
                  width: 380,
                  fit: BoxFit.cover),
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  recipeName(recipe['name']),
                  SizedBox(height: 10),
                  recipeDescription(recipe['description']),
                  SizedBox(height: 10),
                  recipeIcons(recipe),
                  Divider(
                    color: Colors.pink,
                    thickness: 2,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recipeName(name) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.left,
      text: TextSpan(
        text: name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
          fontSize: 22,
        ),
      ),
    );
  }

  Widget recipeDescription(description) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.left,
      text: TextSpan(
        text: description,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 18,
        ),
      ),
    );
  }

  Widget recipeIcons(data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.perm_identity, color: Colors.pink),
                  Text('${data['athor']}'),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.access_time, color: Colors.pink),
                  (int.parse(data['hours']) > 0 &&
                          int.parse(data['minutes']) == 0)
                      ? Text('${data['hours']}' + 'h')
                      : (int.parse(data['hours']) == 0 &&
                              int.parse(data['minutes']) > 0)
                          ? Text('${data['minutes']}' + 'm')
                          : Text(
                              '${data['hours']}' + ':' + '${data['minutes']}'),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    iconSize: 25,
                    padding: const EdgeInsets.only(left: 0, right: 0),
                    icon: Icon(Icons.favorite_border),
                    color: Colors.pink,
//                      onPressed: {print('hi')},
                  ),
                  (int.parse(data['likes']) < 500)
                      ? Text('${data['likes']}')
                      : Text('500+'),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            (FontAwesomeIcons.shareAlt),
            color: Colors.pink,
          ),
        )
      ],
    );
  }
}
