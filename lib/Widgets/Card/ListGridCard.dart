import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myrecipesflutterapp/Models/recipe.dart';
import 'package:myrecipesflutterapp/ViewRecipePage.dart';
import 'package:myrecipesflutterapp/Widgets/Card/BasicCard.dart';
import 'package:myrecipesflutterapp/Widgets/favoriteIcon.dart';

class ListCard extends BasicCard {
  ListCard(Recipe recipe) : super(recipe);

  @override
  State<StatefulWidget> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewRecipePage(recipe: widget.recipe)),
        );
      },
      child: Container(
        color: Colors.grey[800],
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        height: 150,
        width: double.maxFinite,
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2.0, color: Colors.pink),
              ),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: recipeImage(),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      recipeName(),
                      recipeDescription(),
                      recipeDetails(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget recipeImage() {
    return Image(
      image: AssetImage(widget.recipe.image),
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    );
  }

  Widget recipeName() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.left,
        text: TextSpan(
          text: widget.recipe.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget recipeDescription() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.left,
        text: TextSpan(
          text: widget.recipe.description,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget recipeDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.perm_identity,
                      color: Colors.pink,
                      size: 24,
                    ),
                    Text(widget.recipe.author),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Colors.pink,
                      size: 24,
                    ),
                    (widget.recipe.hours > 0 && widget.recipe.minutes == 0)
                        ? Text('${widget.recipe.hours} h')
                        : (widget.recipe.hours == 0 &&
                                widget.recipe.minutes > 0)
                            ? Text('${widget.recipe.minutes} m')
                            : Text(
                                '${widget.recipe.hours}:${widget.recipe.minutes}'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    favoriteIcon(
                        widget.recipe.isFavorite, true, widget.recipe.likes,
                        () {
                      _toggleFavorite();
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      widget.recipe.isFavorite = !widget.recipe.isFavorite;
    });
  }
}
