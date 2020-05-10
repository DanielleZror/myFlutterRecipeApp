import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myrecipesflutterapp/Models/recipe.dart';
import 'package:myrecipesflutterapp/ViewRecipePage.dart';
import 'package:myrecipesflutterapp/Widgets/Card/BasicCard.dart';
import 'package:myrecipesflutterapp/Widgets/favoriteIcon.dart';

class PhotoCard extends BasicCard {
  PhotoCard(Recipe recipe) : super(recipe);

  @override
  State<StatefulWidget> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
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
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image(
                image: AssetImage(widget.recipe.image),
                fit: BoxFit.cover,
              ),
            ),
            Divider(
              color: Colors.pink,
              thickness: 2,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        recipeName(),
                        favoriteIcon(widget.recipe.isFavorite, false,
                            widget.recipe.likes, () {
                          _toggleFavorite();
                        }),
                      ],
                    ),
                    SizedBox(height: 3),
                    recipeDescription(),
                    SizedBox(height: 10),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget recipeName() {
    return Container(
      width: 135,
      child: Text(
        widget.recipe.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }

  Widget recipeDescription() {
    return Text(
      widget.recipe.description,
      style: TextStyle(color: Colors.grey[800], fontSize: 18),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  void _toggleFavorite() {
    setState(() {
      widget.recipe.isFavorite = !widget.recipe.isFavorite;
    });
  }
}
